if Config.Framework ~= "qbox" then
    return
end

debugprint("Loading QBox")

QB = exports["qb-core"]:GetCoreObject()

while not LocalPlayer.state.isLoggedIn do
    Wait(500)
end

local SharedVehicles = QB.Shared.Vehicles
local PlayerJob = QB.Functions.GetPlayerData().job
local PlayerData = QB.Functions.GetPlayerData()

debugprint("QBox loaded")

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    FrameworkLoaded = false
    PlayerData = {}
    PlayerJob = {}

    LogOut()

    debugprint("ON LOG OUT")
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QB.Functions.GetPlayerData()

    FrameworkLoaded = true
    FetchTabletData()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(jobInfo)
    PlayerJob = jobInfo

    TriggerEvent("lb-tablet:jobUpdated")
end)

---@return boolean
function IsAdmin()
    ---@diagnostic disable-next-line: redundant-return-value
    return AwaitCallback("isAdmin")
end

---@return boolean
function HasTabletItem()
    if not Config.Item.Require then
        return true
    end

    if GetResourceState("ox_inventory") == "started" then
        return (exports.ox_inventory:Search("count", Config.Item.Name) or 0) > 0
    end

    return QB.Functions.HasItem(Config.Item.Name)
end

RegisterNetEvent("QBCore:Player:SetPlayerData", function(newData)
    PlayerData = newData

    if not Config.Item.Require then
        return
    end

    OnItemCountChange()
end)

---@return string
function GetJob()
    return PlayerJob.name
end

---@return number
function GetJobGrade()
    return PlayerJob.grade.level
end

function FormatVehicle(vehicle)
    debugprint("Formatting vehicle", vehicle)

    local mods = json.decode(vehicle.mods)
    vehicle.color = GetVehicleColor(mods.color1)
    vehicle.model = SharedVehicles[vehicle.vehicle]?.name or GetVehicleLabel(mods.model)
    vehicle.mods = nil

    if vehicle.name then
        vehicle.owner = {
            name = vehicle.name,
            identifier = vehicle.owner
        }

        vehicle.name = nil
    end

    return vehicle
end

--#region Services

function GetCompanyData()
    local jobData = {
        job = PlayerJob.name,
        jobLabel = PlayerJob.label,
        isBoss = PlayerJob.isboss,
        duty = PlayerJob.onduty,
        receiveCalls = GetCompanyCallsStatus and GetCompanyCallsStatus()
    }

    if not jobData.isBoss then
        return jobData
    end

    jobData.balance = AwaitCallback("qbx:services:getAccount")
    jobData.employees = AwaitCallback("qbx:services:getEmployees")
    jobData.grades = {}

    for k, v in pairs(QB.Shared.Jobs[jobData.job].grades) do
        jobData.grades[#jobData.grades + 1] = {
            label = v.name,
            grade = tonumber(k)
        }
    end

    table.sort(jobData.grades, function(a, b)
        return a.grade < b.grade
    end)

    return jobData
end

function DepositMoney(amount)
    return AwaitCallback("qbx:services:addMoney", amount)
end

function WithdrawMoney(amount)
    return AwaitCallback("qbx:services:removeMoney", amount)
end

function HireEmployee(source)
    if not AwaitCallback("qbx:services:hireEmployee", source) then
        return false
    end

    return AwaitCallback("services:getPlayerData", source)
end

function FireEmployee(citizenid)
    return AwaitCallback("qbx:services:fireEmployee", citizenid)
end

function SetGrade(identifier, newGrade)
    local maxGrade = 0

    for grade, _ in pairs(QB.Shared.Jobs[PlayerJob.name].grades) do
        grade = tonumber(grade)

        if grade and grade > maxGrade then
            maxGrade = grade
        end
    end

    if newGrade > maxGrade then
        return false
    end

    return AwaitCallback("qbx:services:setGrade", identifier, newGrade)
end

function ToggleDuty()
    TriggerServerEvent("QBCore:ToggleDuty")
end

--#endregion

FrameworkLoaded = true
