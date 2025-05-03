Cores = {
    -- { -- New ESX
    --     Name = "ESX",
    --     ResourceName = "frwk",
    --     GetFramework = function() return exports["frwk"]:getSharedObject() end
    -- },
    { -- Old ESX
        Name = "ESX",
        ResourceName = "frwk",
        GetFramework = function() ESX = nil while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) end return ESX end
    },
    {
        Name = "QBCore",
        ResourceName = "qb-core",
        GetFramework = function() return exports["qb-core"]:GetCoreObject() end
    },
    {
        Name = "QBXCore",
        ResourceName = "qbx_core",
        GetFramework = function() return exports["qbx_core"]:GetCoreObject() end
    }
}