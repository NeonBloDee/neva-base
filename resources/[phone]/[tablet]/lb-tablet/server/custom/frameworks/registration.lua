if Config.Framework ~= "registration" then
    return
end

-- Implement your own queries here, making sure to return the same data

Queries = {}

Queries.Users = {}
Queries.Users.Search = [[
    SELECT
        u.character_id AS id,
        CONCAT(u.firstname, ' ', u.lastname) AS `name`,
        u.dateofbirth as dob,
        u.is_male AS isMale,
        p.avatar

    FROM lbtablet_registration_characters u

    LEFT JOIN lbtablet_police_profiles p ON p.id = u.identifier

    WHERE
        CONCAT(u.firstname, ' ', u.lastname) LIKE ?
        {WHERE_FILTER}

    GROUP BY u.character_id, u.firstname, u.lastname, u.dateofbirth, u.is_male, p.avatar

    LIMIT ?, ?
]]

Queries.Users.FetchProfile = [[
    SELECT
        u.character_id AS id,
        CONCAT(u.firstname, ' ', u.lastname) AS `name`,
        u.dateofbirth as dob,
        u.height,
        u.is_male AS isMale,
        p.avatar,
        p.notes,
        u.job AS jobGrade,
        u.job

    FROM lbtablet_registration_characters u

    LEFT JOIN {PROFILE_JOIN} p ON p.id = u.character_id

    WHERE u.character_id = ?

    GROUP BY u.character_id, u.firstname, u.lastname, u.dateofbirth, u.is_male, p.avatar
]]

Queries.Users.SearchFilter = {}
Queries.Users.SearchFilter.Jobs = "AND u.job IN (?)"
Queries.Users.SearchFilter.ExcludeJailed = "AND u.jail = 0"

local fetchVehicle = [[
    SELECT
        v.plate,
        v.character_id AS owner,
        v.model,
        v.color,
        p.avatar AS picture,
        CONCAT(u.firstname, ' ', u.lastname) AS `name`

    FROM lbtablet_registration_vehicles v

    LEFT JOIN lbtablet_registration_characters u ON u.character_id = v.character_id
    LEFT JOIN lbtablet_police_profiles p ON p.id = v.plate
]]

Queries.Vehicles = {}
Queries.Vehicles.SelectModelByPlates = "SELECT plate, model FROM owned_vehicles WHERE plate IN (?)"
Queries.Vehicles.Fetch = fetchVehicle .. " WHERE v.plate = ?"
Queries.Vehicles.Search = fetchVehicle .. [[
    WHERE v.plate LIKE ?
    LIMIT ?, ?
]]

Queries.SelectName = "CONCAT(u.firstname, ' ', u.lastname)"
Queries.SelectDob = "u.dateofbirth"
Queries.JoinName = "LEFT JOIN lbtablet_registration_characters u ON u.character_id = %s"

debugprint("Using standalone")

---@param source number
---@return string | nil
function GetIdentifier(source)
    return GetPlayerIdentifierByType(source, "license")
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    local players = GetPlayers()

    for i = 1, #players do
        if GetPlayerIdentifierByType(players[i], "license") == identifier then
            return players[i]
        end
    end
end

---@param item string
---@param cb fun(source: number)
function CreateUsableItem(item, cb)
end

---@param source number
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return IsPlayerAceAllowed(source, "command.lbtablet_admin") == 1
end

---@param source number
function IsOnDuty(source)
    return true
end

---Get the player's job and grade
---@param source number
---@return { name: string, label: string, grade: number, grade_label: string }
function GetJob(source)
    return {
        name = "unemployed",
        label = "Unemployed",
        grade = 0,
        grade_label = "Unemployed"
    }
end

---Get all vehicles that are owned by a specific identifier
---@param identifier string
---@return { plate: string, model: string, color: string }[]
function GetVehicles(identifier)
    return MySQL.query.await("SELECT plate, model, color FROM lbtablet_registration_vehicles WHERE character_id = ?", { identifier })
end

---Get a player's first and last name
---@param source number
---@return string firstname
---@return string lastname
function GetCharacterName(source)
    local firstname = GetPlayerName(source)
    local lastname = tostring(source)

    return firstname, lastname
end

---Get the character name (firstname + lastname) from an identifier
---@param identifier string
---@return string?
function GetCharacterNameFromIdentifier(identifier)
    return MySQL.scalar.await("SELECT CONCAT(firstname, ' ', lastname) FROM lbtablet_registration_characters WHERE character_id = ?", { identifier })
end

---@type { type: string, label: string }[]
local licenses = {
    { type = "driver", label = "Driver's License" },
    { type = "weapon", label = "Weapon License" },
}

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

---@param identifier string
---@param licenseType string
---@return boolean
function RevokeLicense(identifier, licenseType)
    local label = GetLicenseLabel(licenseType)

    if not label then
        return false
    end

    MySQL.update.await("DELETE FROM lbtablet_registration_licenses WHERE character_id = ? AND license = ?", { identifier, label })

    return true
end

---@param identifier string
---@param licenseType string
---@return boolean
function AddLicense(identifier, licenseType)
    local label = GetLicenseLabel(licenseType)

    if not label then
        return false
    end

    MySQL.update.await("INSERT INTO lbtablet_registration_licenses (character_id, license) VALUES (?, ?)", { identifier, label })

    return false
end

---Get all available licenses and their labels
---@return { label: string, type: string }[]
function GetAllLicenses()
    return licenses
end

local function GetLicenseFromLabel(label)
    for i = 1, #licenses do
        if licenses[i].label == label then
            return licenses[i]
        end
    end
end

---Get a list of all licenses a player has, both type and the label
---@param identifier string
---@return { type: string, label: string }[]
function GetPlayerLicenses(identifier)
    local playerLicenses = MySQL.query.await("SELECT license FROM lbtablet_registration_licenses WHERE character_id = ?", { identifier })
    local formattedLicenses = {}

    for i = 1, #playerLicenses do
        local license = GetLicenseFromLabel(playerLicenses[i].type)

        if license then
            formattedLicenses[#formattedLicenses+1] = {
                type = license.type,
                label = license.label
            }
        end
    end

    return formattedLicenses
end

---Get a list of all jobs and their grades
---@param jobs string | string[]
---@return { grades: { [string]: { grade: number, label: string }[] }, labels: { [string]: string } }
function GetJobGrades(jobs)
    if type(jobs) == "string" then
        jobs = { jobs }
    end

    local grades = {} -- { [job: string]: { grade: number, label: string }[] }
    local labels = {} -- { [job: string]: string }

    return {
        grades = grades,
        labels = labels
    }
end

---Get a list of all players with a specific job
---@param companies string[]
---@return { id: string, callsign?: string, avatar?: string, name: string, job: string, rank: string, phoneNumber?: string }[]
function GetEmployees(companies)
    local employees = {}

    return employees
end

---Get a list of on duty employees for a specific job
---@param jobs { [string]: any }
---@return { source: number, name: string, rank: string, identifier: string }[]
function GetOnDutyEmployees(jobs)
    local employees = {}

    return employees
end

---@param identifier string
---@param time integer The jail time in seconds
---@param reason string
---@return boolean success
function JailPlayer(identifier, time, reason)
    return MySQL.update.await("UPDATE lbtablet_registration_characters SET jail = ? WHERE character_id = ?", { time, identifier }) > 0
end

---@param identifier string
---@return boolean success
function UnjailPlayer(identifier)
    return MySQL.update.await("UPDATE lbtablet_registration_characters SET jail = 0 WHERE character_id = ?", { identifier }) > 0
end

---Get the remaining time of a player's prison sentence, in seconds
function GetRemainingPrisonSentence(identifier)
    return MySQL.scalar.await("SELECT jail FROM lbtablet_registration_characters WHERE character_id = ?", { identifier }) or 0
end

---Get a list of all identifiers with a specific job
---@param jobs string | string[]
---@return string[]
function GetIdentifiersWithJob(jobs)
    if type(jobs) == "string" then
        jobs = { jobs }
    end

    local result = {}

    return result
end

--#region Services app

---Get all employees for a specific company
---@param company string
---@return { identifier: string, firstname: string, lastname: string, grade: number, gradeLabel: string, number?: string, online: boolean }[]
function GetEmployeeList(company)
    local numberTable = Config.LBPhone and (GetPhoneConfig()?.Item.Unique and "phone_last_phone" or "phone_phones") or nil
    local employees = {}

    return employees
end

---Refresh the open status for all companies
function RefreshCompanies()
    for i = 1, #Config.Services.Companies do
        local jobData = Config.Services.Companies[i]

        jobData.open = false
    end
end

---Get a lookup table of identifiers that are online for the player's job
---@return table<string, boolean>
BaseCallback("services:getOnlineIdentifiers", function(source, tabletId)
    local job = GetJob(source).name
    local onlineEmployees = {} -- implement your framework's function to get all online employees for a job here
    local onlineIdentifiers = {}

    for i = 1, #onlineEmployees do
        onlineIdentifiers[onlineEmployees[i].identifier] = true
    end

    return onlineIdentifiers
end)

--#endregion

-- Implement your own logic for handling job updates here

AddEventHandler("jobUpdated", function(src, job, lastJob)
    Wait(0)

    if job.name == lastJob.name then
        return
    end

    TriggerEvent("lb-tablet:jobUpdated", src, job.name)
end)
