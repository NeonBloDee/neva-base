if Config.Framework ~= "qbox" then
    return
end

debugprint("Loading QBox")

QB = exports["qb-core"]:GetCoreObject()

debugprint("QBox loaded")

local playersCollate = ""
local vehiclesCollate = ""

MySQL.ready(function()
    while not GetCollationsForTables do
        Wait(0)
    end

    local collations = GetCollationsForTables({
        players = "citizenid",
        player_vehicles = "plate"
    })

    playersCollate = collations.players or ""
    vehiclesCollate = collations.player_vehicles or ""

    Queries = {}

    Queries.Users = {}
    Queries.Users.Search = ([[
        SELECT
            u.citizenid AS id,
            CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname')) AS `name`,
            JSON_VALUE(u.charinfo, '$.birthdate') AS dob,
            JSON_EXTRACT(u.charinfo, '$.gender') = 0 AS isMale,
            p.avatar

        FROM players u

        LEFT JOIN lbtablet_police_profiles p ON p.id = u.citizenid %s

        WHERE
            CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname')) LIKE ?
            {WHERE_FILTER}

        GROUP BY u.citizenid, p.avatar

        LIMIT ?, ?
    ]]):format(playersCollate)

    Queries.Users.FetchProfile = ([[
        SELECT
            u.citizenid AS id,
            CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname')) AS `name`,
            JSON_VALUE(u.charinfo, '$.birthdate') AS dob,
            JSON_EXTRACT(u.charinfo, '$.gender') = 0 AS isMale,
            JSON_EXTRACT(u.metadata, '$.bloodtype') AS bloodType,
            p.avatar,
            p.notes,
            JSON_VALUE(u.job, '$.grade.name') AS jobGrade,
            JSON_VALUE(u.job, '$.label') AS job

        FROM players u

        LEFT JOIN {PROFILE_JOIN} p ON p.id = u.citizenid %s

        WHERE u.citizenid = ?

        GROUP BY u.citizenid, p.avatar
    ]]):format(playersCollate)

    Queries.Users.SearchFilter = {}
    Queries.Users.SearchFilter.Jobs = "AND JSON_VALUE(u.job, '$.name') IN (?)"

    if Config.JailScript == "xt" then
        Queries.Users.SearchFilter.ExcludeJailed = ("AND NOT EXISTS (SELECT 1 FROM lbtablet_police_jail WHERE prisoner = u.citizenid %s AND jail_time > 0)"):format(playersCollate)
    end

    local fetchVehicle = ([[
        SELECT
            v.plate, v.citizenid AS owner, v.mods, v.vehicle, p.avatar AS picture,
            CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname')) AS `name`

        FROM player_vehicles v

        LEFT JOIN players u ON u.citizenid %s = v.citizenid %s
        LEFT JOIN lbtablet_police_profiles p ON p.id = v.citizenid %s
    ]]):format(playersCollate, vehiclesCollate, vehiclesCollate)

    Queries.Vehicles = {}
    Queries.Vehicles.SelectModelByPlates = "SELECT plate, JSON_VALUE(mods, '$.model') AS model FROM player_vehicles WHERE plate IN (?)"
    Queries.Vehicles.Fetch = fetchVehicle .. " WHERE v.plate = ?"
    Queries.Vehicles.Search = fetchVehicle .. [[
        WHERE v.plate LIKE ?
        LIMIT ?, ?
    ]]

    Queries.SelectName = "CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname'))"
    Queries.SelectDob = "JSON_VALUE(u.charinfo, '$.birthdate')"
    Queries.JoinName = ("LEFT JOIN players u ON u.citizenid %s = %s"):format(playersCollate, "%s")
end)

---@param source number
---@return string | nil
function GetIdentifier(source)
    return QB.Functions.GetPlayer(source)?.PlayerData.citizenid
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    local player = QB.Functions.GetPlayerByCitizenId(identifier)

    if player then
        return player?.PlayerData.source
    end
end

---@param item string
---@param cb function
function CreateUsableItem(item, cb)
    QB.Functions.CreateUseableItem(item, cb)
end

---@param source number
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return QB.Functions.HasPermission(source, "admin") or IsPlayerAceAllowed(source, "command.lbphone_admin") == 1
end

---@param source number
function IsOnDuty(source)
    return QB.Functions.GetPlayer(source).PlayerData.job.onduty
end

---@param source any
---@return integer
function GetBalance(source)
    return QB.Functions.GetPlayer(source)?.Functions.GetMoney("bank") or 0
end

---@param source any
---@param amount integer
---@return boolean
function AddMoney(source, amount)
    local qPlayer = QB.Functions.GetPlayer(source)
    if not qPlayer or amount < 0 then
        return false
    end

    qPlayer.Functions.AddMoney("bank", math.floor(amount + 0.5), "Tablet")
    return true
end

---@param identifier string
---@param amount number
---@return boolean
function AddMoneyOffline(identifier, amount)
    if amount <= 0 then
        return false
    end

    amount = math.floor(amount + 0.5)

    return MySQL.update.await("UPDATE players SET money = JSON_SET(money, '$.bank', JSON_EXTRACT(money, '$.bank') + ?) WHERE citizenid = ?", { amount, identifier }) > 0
end

---@param source any
---@param amount integer
---@return boolean
function RemoveMoney(source, amount)
    if amount < 0 or GetBalance(source) < amount then
        return false
    end

    QB.Functions.GetPlayer(source)?.Functions.RemoveMoney("bank", math.floor(amount + 0.5), "Tablet")
    return true
end

---@param source number
---@return { name: string, label: string, grade: number, grade_label: string }
function GetJob(source)
    local job = QB.Functions.GetPlayer(source).PlayerData.job

    return {
        name = job.name,
        label = job.label,
        grade = job.grade.level,
        grade_label = job.grade.name
    }
end

---@param identifier string
---@return { plate: string, type: string, vehicle: string }[]
function GetVehicles(identifier)
    local vehicles = MySQL.query.await("SELECT plate, vehicle, mods FROM player_vehicles WHERE citizenid = ?", { identifier })

    for i = 1, #vehicles do
        local vehicle = vehicles[i]
        local vehicleData = QB.Shared.Vehicles[vehicle.vehicle]

        vehicle.vehicle = vehicle.mods
        vehicle.type = vehicleData?.category or "Unknown"
    end

    return vehicles
end

---@param source number
---@return string firstname
---@return string lastname
function GetCharacterName(source)
    local characterInfo = QB.Functions.GetPlayer(source).PlayerData.charinfo

    return characterInfo.firstname, characterInfo.lastname
end

---@param identifier string
---@return string?
function GetCharacterNameFromIdentifier(identifier)
    local characterInfo = QB.Functions.GetPlayerByCitizenId(identifier)?.PlayerData?.charinfo

    if not characterInfo then
        characterInfo = MySQL.scalar.await("SELECT charinfo FROM players WHERE citizenid = ?", { identifier })

        if characterInfo then
            characterInfo = json.decode(characterInfo)
        else
            return
        end
    end

    return characterInfo.firstname .. " " .. characterInfo.lastname
end

local licenses = {
    {
        label = "Driver's License",
        type = "driver"
    },
    {
        label = "Weapon License",
        type = "weapon"
    }
}

---@param licenseType string
---@return boolean
local function DoesLicenseExist(licenseType)
    for i = 1, #licenses do
        if licenses[i].type == licenseType then
            return true
        end
    end

    return false
end

---@param identifier string
---@param licenseType string
---@return boolean
function RevokeLicense(identifier, licenseType)
    if not DoesLicenseExist(licenseType) then
        return false
    end

    local qPlayer = QB.Functions.GetPlayerByCitizenId(identifier)

    if qPlayer then
        qPlayer.PlayerData.metadata.licences[licenseType] = false
        qPlayer.Functions.SetMetaData("licences", qPlayer.PlayerData.metadata.licences)
        return true
    end

    local metadata = MySQL.scalar.await("SELECT metadata FROM players WHERE citizenid = ?", { identifier })

    if not metadata then
        return false
    end

    metadata = json.decode(metadata)
    metadata.licences = metadata.licences or {}
    metadata.licences[licenseType] = false

    return MySQL.update.await("UPDATE players SET metadata = ? WHERE citizenid = ?", { json.encode(metadata), identifier }) > 0
end

---@param identifier string
---@param licenseType string
---@return boolean
function AddLicense(identifier, licenseType)
    if not DoesLicenseExist(licenseType) then
        return false
    end

    local qPlayer = QB.Functions.GetPlayerByCitizenId(identifier)

    if qPlayer then
        qPlayer.PlayerData.metadata.licences[licenseType] = true
        qPlayer.Functions.SetMetaData("licences", qPlayer.PlayerData.metadata.licences)
        return true
    end

    local metadata = MySQL.scalar.await("SELECT metadata FROM players WHERE citizenid = ?", { identifier })

    if not metadata then
        return false
    end

    metadata = json.decode(metadata)
    metadata.licences = metadata.licences or {}
    metadata.licences[licenseType] = true

    return MySQL.update.await("UPDATE players SET metadata = ? WHERE citizenid = ?", { json.encode(metadata), identifier }) > 0
end

---@param licenseType string
---@return string
function GetLicenseLabel(licenseType)
    for i = 1, #licenses do
        if licenses[i].type == licenseType then
            return licenses[i].label
        end
    end

    return licenseType
end

---@return { label: string, type: string }[]
function GetAllLicenses()
    return licenses
end

---@param identifier string
---@return { type: string, label: string }[]
function GetPlayerLicenses(identifier)
    local qPlayer = QB.Functions.GetPlayerByCitizenId(identifier)
    local cleanedLicenses = {}
    local playerLicenses

    if qPlayer then
        playerLicenses = qPlayer.PlayerData.metadata.licences or {}
    else
        local metadata = MySQL.scalar.await("SELECT metadata FROM players WHERE citizenid = ?", { identifier })

        metadata = metadata and json.decode(metadata)
        playerLicenses = metadata?.licences or {}
    end

    for licenseType, hasLicense in pairs(playerLicenses) do
        if hasLicense then
            cleanedLicenses[#cleanedLicenses+1] = {
                type = licenseType,
                label = GetLicenseLabel(licenseType)
            }
        end
    end

    return cleanedLicenses
end

---@param jobs string | string[]
---@return { grades: { [string]: { grade: number, label: string }[] }, labels: { [string]: string } }
function GetJobGrades(jobs)
    if type(jobs) == "string" then
        jobs = { jobs }
    end

    local qbJobs = QB.Shared.Jobs
    local grades = {}
    local labels = {}

    for i = 1, #jobs do
        local job = jobs[i]
        local jobData = qbJobs[job]

        if not jobData then
            debugprint("Invalid job: " .. job)
            goto continue
        end

        grades[job] = {}
        labels[job] = jobData.label

        local amountGrades = 0

        for gradeLevel, gradeData in pairs(jobData.grades) do
            amountGrades += 1
            grades[job][amountGrades] = {
                grade = tonumber(gradeLevel),
                label = gradeData.name
            }
        end

        table.sort(grades[job], function(a, b)
            return a.grade < b.grade
        end)

        ::continue::
    end

    return {
        grades = grades,
        labels = labels
    }
end

---@param companies string[]
function GetEmployees(companies)
    local query = ([[
        SELECT
            u.citizenid AS id,
            a.callsign,
            a.avatar,
            CONCAT(JSON_VALUE(u.charinfo, '$.firstname'), ' ', JSON_VALUE(u.charinfo, '$.lastname')) AS `name`,
            JSON_VALUE(u.job, '$.grade.level') AS rank,
            JSON_VALUE(u.job, '$.name') AS job
            %s
        FROM players u
        LEFT JOIN lbtablet_police_accounts a ON a.id = u.citizenid %s
        %s
        WHERE JSON_VALUE(u.job, '$.name') IN (?)
    ]]):format("%s", playersCollate, "%s")

    if Config.LBPhone then
        local phoneConfig = GetPhoneConfig()

        if phoneConfig?.Item.Unique then
            query = query:format(
                ", p.phone_number AS phoneNumber",
                ("LEFT JOIN phone_last_phone p ON u.citizenid %s = p.id"):format(playersCollate)
            )
        else
            query = query:format(
                ", p.phone_number AS phoneNumber",
                ("LEFT JOIN phone_phones p ON u.citizenid %s = p.id"):format(playersCollate)
            )
        end
    else
        query = query:format("", "")
    end

    local employees = MySQL.query.await(query, { companies })

    for i = 1, #employees do
        employees[i].rank = tonumber(employees[i].rank)
    end

    return employees
end

---@param jobs { [string]: any }
---@return { source: number, name: string, rank: string, identifier: string }[]
function GetOnDutyEmployees(jobs)
    local employees = {}
    local players = QB.Functions.GetQBPlayers()

    for i = 1, #players do
        local qPlayer = players[i]
        local playerData = qPlayer and qPlayer.PlayerData

        if playerData?.job?.onduty and jobs[qPlayer.PlayerData.job.name] then
            employees[#employees+1] = {
                source = playerData.source,
                name = playerData.charinfo.firstname .. " " .. playerData.charinfo.lastname,
                rank = playerData.job.grade.name,
                identifier = playerData.citizenid
            }
        end
    end

    return employees
end

---@param jobs string | string[]
---@return string[]
function GetIdentifiersWithJob(jobs)
    if type(jobs) == "string" then
        jobs = { jobs }
    end

    local identifiers = MySQL.query.await("SELECT citizenid FROM players WHERE JSON_VALUE(job, '$.name') IN (?)", { jobs })
    local result = {}

    for i = 1, #identifiers do
        result[i] = identifiers[i].citizenid
    end

    return result
end

--#region Services

local playerJobs = {}
local jobCounts = {}
local jobDutyCounts = {}

function RefreshCompanies()
    if Config.QBOldJobMethod then
        debugprint("using old method to refresh companies")

        local openJobs = {}
        local players = QB.Functions.GetQBPlayers()

        for _, v in pairs(players) do
            if not v?.PlayerData.job.onduty then
                goto continue
            end

            local job = v.PlayerData.job.name
            if not openJobs[job] then
                openJobs[job] = true
            end

            ::continue::
        end

        for i = 1, #Config.Services.Companies do
            local jobData = Config.Services.Companies[i]

            jobData.open = openJobs[jobData.job] or false
        end

        return
    end

    for i = 1, #Config.Services.Companies do
        local jobData = Config.Services.Companies[i]

        jobData.open = (jobDutyCounts[jobData.job] or 0) > 0
    end
end

CreateThread(function()
    for _, player in pairs(QB.Functions.GetQBPlayers()) do
        local playerData = player.PlayerData
        local job = playerData.job
        local jobName = job.name
        local onDuty = job.onduty

        playerJobs[playerData.source] = {
            name = jobName,
            onduty = onDuty
        }

        jobCounts[jobName] = (jobCounts[jobName] or 0) + 1
        jobDutyCounts[jobName] = (jobDutyCounts[jobName] or 0) + (onDuty and 1 or 0)
    end

    debugprint("qb jobs: initial data", playerJobs, jobCounts, jobDutyCounts)
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    local job = Player.PlayerData.job
    local src = Player.PlayerData.source
    local jobName = job?.name
    local onDuty = job?.onduty

    if not jobName then
        return
    end

    playerJobs[src] = {
        name = jobName,
        onduty = onDuty
    }

    jobCounts[jobName] = (jobCounts[jobName] or 0) + 1
    jobDutyCounts[jobName] = (jobDutyCounts[jobName] or 0) + (onDuty and 1 or 0)

    debugprint("qb jobs: player loaded update (src, job, duty)", src, job.name, job.onduty)
end)

local function OnPlayerJobUpdate(src, job)
    local shouldRefresh = false
    local lastJob = playerJobs[src]
    local lastName = lastJob and lastJob.name
    local lastDuty = lastJob and lastJob.onduty
    local jobName = job.name
    local onDuty = job.onduty

    debugprint("qb jobs: job/duty update (src, job, duty)", src, job.name, job.onduty)

    if lastJob and lastName == jobName then
        if lastJob.onduty == onDuty then
            return
        end

        jobDutyCounts[jobName] = (jobDutyCounts[jobName] or 0) + (onDuty and 1 or -1)
    else
        if lastJob then
            jobCounts[lastName] = (jobCounts[lastName] or 0) - 1
            jobDutyCounts[lastName] = (jobDutyCounts[lastName] or 0) - (lastDuty and 1 or 0)

            local oldCount = jobDutyCounts[lastName]

            if oldCount == 0 or oldCount == 1 then
                TriggerClientEvent("phone:services:updateOpen", -1, lastName, oldCount == 1)
                shouldRefresh = true
            end
        end

        jobCounts[jobName] = (jobCounts[jobName] or 0) + 1
        jobDutyCounts[jobName] = (jobDutyCounts[jobName] or 0) + (onDuty and 1 or 0)
    end

    playerJobs[src] = {
        name = jobName,
        onduty = onDuty
    }

    local newCount = jobDutyCounts[jobName]

    if newCount == 0 or newCount == 1 then
        TriggerClientEvent("phone:services:updateOpen", -1, jobName, newCount == 1)
        shouldRefresh = true
    end

    if shouldRefresh then
        RefreshCompanies()
    end

    debugprint(playerJobs, jobCounts, jobDutyCounts)
end

AddEventHandler("QBCore:Server:SetDuty", function(src, duty)
    Wait(0) -- makes it print in server console instead of chat when using commands

    OnPlayerJobUpdate(src, {
        name = playerJobs[src].name,
        onduty = duty
    })
end)

AddEventHandler("QBCore:Server:OnJobUpdate", function(src, job)
    Wait(0) -- makes it print in server console instead of chat when using commands

    OnPlayerJobUpdate(src, job)
end)

local function UnloadJob(src)
    local lastJob = playerJobs[src]

    if not lastJob then
        return
    end

    jobCounts[lastJob.name] = (jobCounts[lastJob.name] or 0) - 1
    jobDutyCounts[lastJob.name] = (jobDutyCounts[lastJob.name] or 0) - (lastJob.onduty and 1 or 0)

    playerJobs[src] = nil

    debugprint(playerJobs, jobCounts, jobDutyCounts)
end

AddEventHandler("QBCore:Server:OnPlayerUnload", function(src)
    Wait(0)
    debugprint("qb jobs: player unload", src)

    UnloadJob(src)
end)

AddEventHandler("playerDropped", function()
    local src = source

    debugprint("qb jobs: player dropped", src)
    UnloadJob(src)
end)

---@param company string
function GetEmployeeList(company)
    local numberTable = Config.LBPhone and (GetPhoneConfig()?.Item.Unique and "phone_last_phone" or "phone_phones") or nil
    local joinPhone = Config.LBPhone and ("LEFT JOIN %s p ON u.citizenid %s = p.id"):format(numberTable, playersCollate) or ""

    local employees = MySQL.query.await([[
        SELECT
            u.citizenid, u.charinfo, u.job, p.phone_number

        FROM players u

        ]] .. joinPhone .. [[

        WHERE JSON_VALUE(u.job, '$.name') = ?
    ]], { company })

    local players = QB.Functions.GetQBPlayers()
    local onlineCitizenIds = {}

    for _, qPlayer in pairs(players) do
        if qPlayer.PlayerData.job.name == company then
            onlineCitizenIds[qPlayer.PlayerData.citizenid] = true
        end
    end

    for i = 1, #employees do
        local employee = employees[i]
        local charinfo = json.decode(employee.charinfo)
        local job = json.decode(employee.job)

        employees[i] = {
            firstname = charinfo.firstname,
            lastname = charinfo.lastname,
            number = employee.phone_number,
            gradeLabel = job.grade.name,
            grade = job.grade.level,
            online = onlineCitizenIds[employee.citizenid],
        }
    end

    return employees
end

RegisterCallback("services:getPlayerData", function(source, player)
    local first, last = GetCharacterName(player)

    return {
        name = first .. " " .. last,
        id = GetIdentifier(player),
    }
end)

BaseCallback("services:getOnlineCitizenIds", function(source, tabletId)
    local job = GetJob(source).name
    local players = QB.Functions.GetQBPlayers()
    local onlineCitizenIds = {}

    for _, qPlayer in pairs(players) do
        if qPlayer.PlayerData.job.name == job then
            onlineCitizenIds[qPlayer.PlayerData.citizenid] = true
        end
    end

    return onlineCitizenIds
end)

RegisterCallback("qbx:services:getEmployees", function(source)
    local employees = {}
    local job = QB.Functions.GetPlayer(source).PlayerData.job

    if not job.isboss then
        return employees
    end

    local members = exports.qbx_core:GetGroupMembers(job.name, "job")

    for i = 1, #members do
        local member = members[i]
        local gradeLevel = member.grade
        local citizenid = member.citizenid
        local player = exports.qbx_core:GetPlayerByCitizenId(citizenid) or exports.qbx_core:GetOfflinePlayer(citizenid)

        employees[#employees+1] = {
            name = player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname,
            id = member.citizenid,

            gradeLabel = player.PlayerData.job.grade.name,
            grade = gradeLevel,

            canInteract = not player.PlayerData.job.isboss,

            online = not player.Offline
        }
    end

    return employees
end)

RegisterCallback("qbx:services:hireEmployee", function(source, playerId)
    local player = QB.Functions.GetPlayer(source)
    local target = QB.Functions.GetPlayer(playerId)

    if not player.PlayerData.job.isboss or not target then
        return false
    end

    local success = exports.qbx_core:AddPlayerToJob(target.PlayerData.citizenid, player.PlayerData.job.name, 0)

    if not success then
        return false
    end

    success = exports.qbx_core:SetPlayerPrimaryJob(target.PlayerData.citizenid, player.PlayerData.job.name)

    return success
end)

RegisterCallback("qbx:services:fireEmployee", function(source, citizenid)
    local player = QB.Functions.GetPlayer(source)

    if not player.PlayerData.job.isboss then
        return false
    end

    local success = exports.qbx_core:RemovePlayerFromJob(citizenid, player.PlayerData.job.name)

    return success
end)

RegisterCallback("qbx:services:setGrade", function(source, citizenid, newGrade)
    local player = QB.Functions.GetPlayer(source)

    if not player.PlayerData.job.isboss then
        return false
    end

    local success = exports.qbx_core:AddPlayerToJob(citizenid, player.PlayerData.job.name, newGrade)

    return success
end)

local function GetSocietyMoney(job)
    return exports["Renewed-Banking"]:getAccountMoney(job) or 0
end

RegisterCallback("qbx:services:getAccount", function(source)
    local job = QB.Functions.GetPlayer(source).PlayerData.job
    local jobName = job.name

    if not job.isboss then
        return 0
    end

    return GetSocietyMoney(jobName)
end)

RegisterCallback("qbx:services:addMoney", function(source, amount)
    local job = QB.Functions.GetPlayer(source).PlayerData.job
    local jobName = job.name

    if amount < 0 or GetBalance(source) < amount then
        return false
    end

    local success = exports["Renewed-Banking"]:addAccountMoney(jobName, amount)

    if not success then
        return false
    end

    RemoveMoney(source, amount)

    return GetSocietyMoney(jobName)
end)

RegisterCallback("qbx:services:removeMoney", function(source, amount)
    local job = QB.Functions.GetPlayer(source).PlayerData.job
    local jobName = job.name

    if not job.isboss or amount < 0 or GetSocietyMoney(jobName) < amount then
        return false
    end

    local success = exports["Renewed-Banking"]:removeAccountMoney(jobName, amount)

    if not success then
        return false
    end

    AddMoney(source, amount)

    return GetSocietyMoney(jobName)
end)

--#endregion

function GetWeaponName(weapon)
    weapon = weapon:lower()

    return QB.Shared.Items[weapon] and QB.Shared.Items[weapon].label or weapon
end

function GetWeaponImage(weapon)
    if GetResourceState("ox_inventory") == "started" then
        local fileName = "web/images/" .. weapon:upper() .. ".png"
        local fileExists = LoadResourceFile("ox_inventory", fileName)

        if fileExists then
            return "https://cfx-nui-ox_inventory/" .. fileName
        end
    end
end

AddEventHandler("QBCore:Server:OnPlayerUnload", function(src)
    Wait(0)
    PlayerLoggedOut(src)
end)
