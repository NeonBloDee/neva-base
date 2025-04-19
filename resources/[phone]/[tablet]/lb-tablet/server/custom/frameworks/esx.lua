if Config.Framework ~= "esx" then
    return
end

local usersCollate = ""
local vehiclesCollate = ""

MySQL.ready(function()
    while not GetCollationsForTables do
        Wait(0)
    end

    local collations = GetCollationsForTables({
        users = "identifier",
        owned_vehicles = "plate"
    })

    usersCollate = collations.users or ""
    vehiclesCollate = collations.owned_vehicles or ""

    Queries = {}

    Queries.Users = {}
    Queries.Users.Search = ([[
        SELECT
            u.identifier AS id,
            CONCAT(u.firstname, ' ', u.lastname) AS `name`,
            u.dateofbirth as dob,
            u.sex = "m" AS isMale,
            p.avatar

        FROM users u

        LEFT JOIN lbtablet_police_profiles p ON p.id = u.identifier %s

        WHERE
            CONCAT(u.firstname, ' ', u.lastname) LIKE ?
            {WHERE_FILTER}

        GROUP BY u.identifier, u.firstname, u.lastname, u.dateofbirth, u.sex, p.avatar

        LIMIT ?, ?
    ]]):format(usersCollate)

    Queries.Users.FetchProfile = ([[
        SELECT
            u.identifier AS id,
            CONCAT(u.firstname, ' ', u.lastname) AS `name`,
            u.dateofbirth as dob,
            u.height,
            u.sex = "m" AS isMale,
            p.avatar,
            p.notes,
            g.label AS jobGrade,
            j.label AS job

        FROM users u

        LEFT JOIN {PROFILE_JOIN} p ON p.id = u.identifier %s

        LEFT JOIN jobs j ON j.`name` = u.job
        LEFT JOIN job_grades g ON g.job_name = u.job AND g.grade = u.job_grade

        WHERE u.identifier = ?

        GROUP BY u.identifier, u.firstname, u.lastname, u.dateofbirth, u.sex, p.avatar
    ]]):format(usersCollate)

    Queries.Users.SearchFilter = {}
    Queries.Users.SearchFilter.Jobs = "AND u.job IN (?)"

    if Config.JailScript == "qalle" then
        Queries.Users.SearchFilter.ExcludeJailed = "AND u.jail = 0"
    elseif Config.JailScript == "esx" then
        Queries.Users.SearchFilter.ExcludeJailed = "AND u.jail_time = 0"
    elseif Config.JailScript == "pickle" then
        Queries.Users.SearchFilter.ExcludeJailed = ("AND NOT EXISTS (SELECT 1 FROM pickle_prisons WHERE identifier %s = u.identifier %s)"):format(usersCollate, usersCollate)
    elseif Config.JailScript == "rcore" then
        Queries.Users.SearchFilter.ExcludeJailed = ("AND NOT EXISTS (SELECT 1 FROM rcore_prison WHERE owner %s = u.identifier %s)"):format(usersCollate, usersCollate)
    end

    local fetchVehicle = ([[
        SELECT
            v.plate, v.owner, v.vehicle, p.avatar AS picture, CONCAT(u.firstname, ' ', u.lastname) AS `name`

        FROM owned_vehicles v

        LEFT JOIN users u ON u.identifier %s = v.owner %s
        LEFT JOIN lbtablet_police_profiles p ON p.id = v.plate %s
    ]]):format(usersCollate, vehiclesCollate, vehiclesCollate)

    Queries.Vehicles = {}
    Queries.Vehicles.SelectModelByPlates = "SELECT plate, json_value(vehicle, '$.model') AS model FROM owned_vehicles WHERE plate IN (?)"
    Queries.Vehicles.Fetch = fetchVehicle .. " WHERE v.plate = ?"
    Queries.Vehicles.Search = fetchVehicle .. [[
        WHERE v.plate LIKE ?
        LIMIT ?, ?
    ]]

    Queries.SelectName = "CONCAT(u.firstname, ' ', u.lastname)"
    Queries.SelectDob = "u.dateofbirth"
    Queries.JoinName = ("LEFT JOIN users u ON u.identifier %s = %s"):format(usersCollate, "%s")
end)

debugprint("Loading ESX")

local export, obj = pcall(function()
    return exports.frwk:getSharedObject()
end)

if not export then
    TriggerEvent("esx:getSharedObject", function(esx)
        obj = esx
    end)
end

ESX = obj

debugprint("ESX loaded")

---@param source number
---@return string | nil
function GetIdentifier(source)
    return ESX.GetPlayerFromId(source)?.identifier
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

    if xPlayer then
        return xPlayer.source
    end
end

---@param item string
---@param cb fun(source: number)
function CreateUsableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end

---@param source number
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return ESX.GetPlayerFromId(source)?.getGroup() == "superadmin" or IsPlayerAceAllowed(source, "command.lbtablet_admin") == 1
end

---@param source number
function IsOnDuty(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.onDuty == nil then
        return true
    end

    return xPlayer.job.onDuty == true
end

---@param source number
---@return { name: string, label: string, grade: number, grade_label: string }
function GetJob(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    return xPlayer.job
end

---@param identifier string
---@return { plate: string, type: string, vehicle: string }[]
function GetVehicles(identifier)
    return MySQL.query.await("SELECT plate, vehicle, `type` FROM owned_vehicles WHERE owner = ?", { identifier })
end

---@param source number
---@return string firstname
---@return string lastname
function GetCharacterName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local firstName = xPlayer.get and xPlayer.get("firstName")
    local lastName = xPlayer.get and xPlayer.get("lastName")

    if not firstName or not lastName then
        local row = MySQL.single.await("SELECT firstname, lastname FROM users WHERE identifier=?", { GetIdentifier(source) })

        firstName = row?.firstname or GetPlayerName(source)
        lastName = row?.lastname or ""
    end

    return firstName, lastName
end

---@param identifier string
---@return string?
function GetCharacterNameFromIdentifier(identifier)
    local xPlayer = ESX.GetPlayerFromIdentifier and ESX.GetPlayerFromIdentifier(identifier)

    if xPlayer then
        return xPlayer.getName()
    end

    return MySQL.scalar.await("SELECT CONCAT(firstname, ' ', lastname) FROM users WHERE identifier = ?", { identifier }) or ""
end

---@type { type: string, label: string }[]
local licenses

MySQL.ready(function()
    licenses = MySQL.query.await("SELECT `type`, label FROM licenses")
end)

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

    return MySQL.update.await("DELETE FROM user_licenses WHERE owner = ? AND `type` = ?", { identifier, licenseType }) > 0
end

---@param identifier string
---@param licenseType string
---@return boolean
function AddLicense(identifier, licenseType)
    if not DoesLicenseExist(licenseType) then
        return false
    end

    return MySQL.update.await("INSERT INTO user_licenses (owner, `type`) VALUES (?, ?)", { identifier, licenseType }) > 0
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
    local playerLicenses = MySQL.query.await("SELECT `type` FROM user_licenses WHERE owner = ?", { identifier })

    for i = 1, #playerLicenses do
        local license = playerLicenses[i]

        license.label = GetLicenseLabel(license.type)
    end

    return playerLicenses
end

---@param jobs string | string[]
---@return { grades: { [string]: { grade: number, label: string }[] }, labels: { [string]: string } }
function GetJobGrades(jobs)
    if type(jobs) == "string" then
        jobs = { jobs }
    end

    -- Remplacez `ESX.GetJobs()` par votre méthode pour obtenir les métiers
    local esxJobs = ESX.Jobs or {} -- Exemple : Utilisation d'une table globale
    if not esxJobs or type(esxJobs) ~= "table" then
        debugprint("ESX.Jobs non disponible ou invalide")
        return {
            grades = {},
            labels = {}
        }
    end

    local grades = {}
    local labels = {}

    for i = 1, #jobs do
        local job = jobs[i]
        local jobData = esxJobs[job]

        if not jobData then
            debugprint("Job non trouvé", job)
            goto continue
        end

        grades[job] = {}
        labels[job] = jobData.label

        local amountGrades = 0

        for _, grade in pairs(jobData.grades or {}) do
            amountGrades += 1
            grades[job][amountGrades] = {
                grade = grade.grade,
                label = grade.label
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
        SELECT u.identifier AS id,
        a.callsign,
        a.avatar,
        CONCAT(u.firstname, ' ', u.lastname) AS `name`,
        u.job,
        u.job_grade AS `rank`
        %s

        FROM users u
        LEFT JOIN lbtablet_police_accounts a ON a.id = u.identifier %s
        %s

        WHERE u.job IN (?)
    ]]):format("%s", usersCollate, "%s")

    if Config.LBPhone then
        local phoneConfig = GetPhoneConfig()

        if phoneConfig?.Item.Unique then
            query = query:format(
                ", p.phone_number AS phoneNumber",
                ("LEFT JOIN phone_last_phone p ON u.identifier %s = p.id"):format(usersCollate)
            )
        else
            query = query:format(
                ", p.phone_number AS phoneNumber",
                ("LEFT JOIN phone_phones p ON u.identifier %s = p.id"):format(usersCollate)
            )
        end
    else
        query = query:format("", "")
    end

    return MySQL.query.await(query, { companies })
end

---@param jobs { [string]: any }
---@return { source: number, name: string, rank: string, identifier: string }[]
function GetOnDutyEmployees(jobs)
    local employees = {}
    local players = ESX.GetExtendedPlayers()

    for i = 1, #players do
        local xPlayer = players[i]

        if jobs[xPlayer.job.name] then
            employees[#employees+1] = {
                source = xPlayer.source,
                name = xPlayer.name,
                rank = xPlayer.job.grade_label,
                identifier = xPlayer.identifier
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

    local identifiers = MySQL.query.await("SELECT identifier FROM users WHERE job IN (?)", { jobs })
    local result = {}

    for i = 1, #identifiers do
        result[i] = identifiers[i].identifier
    end

    return result
end

--#region Services app

RegisterNetEvent("tablet:services:toggleDuty", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.setJob(xPlayer.job.name, xPlayer.job.grade, not xPlayer.job.onDuty)
    end
end)

---@param company string
function GetEmployeeList(company)
    local numberTable = Config.LBPhone and (GetPhoneConfig()?.Item.Unique and "phone_last_phone" or "phone_phones") or nil
    local joinPhone = Config.LBPhone and ("LEFT JOIN %s p ON u.identifier %s = p.id"):format(numberTable, usersCollate) or ""

    local employees = MySQL.query.await([[
        SELECT
            u.identifier,
            u.firstname, u.lastname,
            u.job_grade AS grade,
            ]] .. (Config.LBPhone and "p.phone_number AS `number`," or "") .. [[
            j.label AS gradeLabel

        FROM users u
        ]] .. joinPhone .. [[
        JOIN job_grades j ON u.job = j.job_name AND u.job_grade = j.grade
        WHERE u.job = ?
    ]], { company })

    local onlineEmployees = ESX.GetExtendedPlayers("job", company)
    local onlineIdentifiers = {}

    for i = 1, #onlineEmployees do
        onlineIdentifiers[onlineEmployees[i].identifier] = true
    end

    for i = 1, #employees do
        local employee = employees[i]

        employee.online = onlineIdentifiers[employee.identifier] or false
        employee.identifier = nil
    end

    return employees
end

function RefreshCompanies()
    if ESX.JobsPlayerCount then
        debugprint("Using new ESX method for refreshing companies")

        for i = 1, #Config.Services.Companies do
            local jobData = Config.Services.Companies[i]
            local jobKey = ("%s:count"):format(jobData.job)

            jobData.open = (GlobalState[jobKey] or 0) > 0
            debugprint("Job", jobData.job, "is open:", jobData.open)
        end

        return
    end

    -- debugprint("Using old ESX method for refreshing companies")

    local openJobs = {}
    local xPlayers = ESX.GetExtendedPlayers and ESX.GetExtendedPlayers() or ESX.GetPlayers()

    if ESX.GetExtendedPlayers then
        for _, xPlayer in pairs(xPlayers) do
            openJobs[xPlayer.job.name] = true
        end

        -- infoprint("warning", "You are running an outdated version of ESX. The script will still work, but you should consider updating. (you can remove this warning in server/custom/frameworks/esx.lua)")
    else
        for _, source in pairs(xPlayers) do
            local job = ESX.GetPlayerFromId(source).job.name

            openJobs[job] = true
        end

        -- infoprint("warning", "You are running an extremely old version of ESX. The script will still work, but you should consider updating. (you can remove this warning in server/custom/frameworks/esx.lua)")
    end

    for i = 1, #Config.Services.Companies do
        local jobData = Config.Services.Companies[i]

        jobData.open = openJobs[jobData.job] or false
    end
end

for i = 1, #Config.Services.Companies do
    local jobData = Config.Services.Companies[i]
    local jobKey = ("%s:count"):format(jobData.job)

    AddStateBagChangeHandler(jobKey, "global", function(_, _, value)
        Wait(0) -- prevent print from showing in F8 when using command

        if type(value) ~= "number" then
            return
        end

        local isOpen = value > 0

        if jobData.open ~= isOpen then
            jobData.open = isOpen
            TriggerClientEvent("tablet:services:updateOpen", -1, jobData.job, isOpen)
        end

        debugprint(("Job count for job ^5%s^7 changed. Is open: %s"):format(jobData.job, jobData.open))
    end)
end

BaseCallback("services:getOnlineIdentifiers", function(source, tabletId)
    local job = GetJob(source).name
    local onlineEmployees = ESX.GetExtendedPlayers("job", job)
    local onlineIdentifiers = {}

    for i = 1, #onlineEmployees do
        onlineIdentifiers[onlineEmployees[i].identifier] = true
    end

    return onlineIdentifiers
end)

--#endregion

function GetWeaponName(weapon)
    return ESX.GetWeaponLabel(weapon)
end

function GetWeaponImage(weapon)
    weapon = weapon:upper()

    if GetResourceState("ox_inventory") == "started" then
        local fileName = "web/images/" .. weapon .. ".png"
        local fileExists = LoadResourceFile("ox_inventory", fileName)

        if fileExists then
            return "https://cfx-nui-ox_inventory/" .. fileName
        end
    end
end

AddEventHandler("esx:setJob", function(src, job, lastJob)
    Wait(0)

    if job.name == lastJob.name then
        return
    end

    TriggerEvent("lb-tablet:jobUpdated", src, job.name)
end)

AddEventHandler("esx:playerLogout", function(source)
    PlayerLoggedOut(source)
end)
