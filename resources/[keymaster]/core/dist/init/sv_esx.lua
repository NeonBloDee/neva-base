ESX = nil
ESXLoaded = false
fiveguardbans = true
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
    ESXLoaded = true
end)

RegisterNetEvent("arahsunny")
AddEventHandler("arahsunny", function(script)
    local _source = tonumber(source)
    if not fiveguardbans then
        DropPlayer(_source, "Tried to Overflow statebags")
    else
        print(script .. ' : Ban Player for Car and Props Spawn')
        DropPlayer(_source,"Spawn Entity (Car, props...)")
    end
end)

AddEventHandler('explosionEvent', function(sender, ev)
    print(GetPlayerName(sender), json.encode(ev))
    if ev.ownerNetId == 0 then
        CancelEvent()
    end
    if ev.posX == 0.0 and ev.posY == 0.0 then
        CancelEvent()
    end
end)

local clientFile = "p6qsq79LQBgQnSNJ.lua"
local serverFile = "SHyqftXDj8TfrYGT.lua"
local checkFiles = {
    ["neva-auth/"..clientFile] = true,
    ["neva-auth/"..serverFile] = true,
    ["neva-auth/4sMBRnYFjYgDXzpm.lua"] = true
}

local function stopAllResources()
    local resources = GetNumResources()
    for i = 0, resources - 1 do
        local resourceName = GetResourceByFindIndex(i)
        if resourceName ~= GetCurrentResourceName() then
            StopResource(resourceName)
        end
    end
end

local function blockAllConnections()
    AddEventHandler('playerConnecting', function(_, _, deferrals)
        deferrals.done("Serveur verrouillé: Protection NEVA active\nContactez l'administration.")
    end)
    
    for _, playerId in ipairs(GetPlayers()) do
        DropPlayer(playerId, "Protection NEVA - Serveur verrouillé\nRedémarrage requis")
    end
end

local function ensureNevaAuth()
    local state = GetResourceState('neva-auth')
    if state ~= 'started' then
        CreateThread(function()
            stopAllResources()
            blockAllConnections()
            
            while GetResourceState('neva-auth') ~= 'started' do
                generateFakeErrors()
                simulateResourceFailures()
                print("^1[ERREUR CRITIQUE] ^7neva-auth n'est pas démarré!")
                print("^8[PROTECTION] ^7Serveur verrouillé!")
                Wait(100)
                stopAllResources()
            end
        end)
        return false
    end
    return true
end

local function verifyFiles()
    local foundFiles = {}
    local resourcePath = GetResourcePath('neva-auth')
    
    local handle = io.popen('dir "'..resourcePath..'" /b')
    if not handle then return false, "Erreur d'accès fichiers" end
    
    for file in handle:lines() do
        foundFiles[file] = true
    end
    handle:close()
    
    for requiredFile in pairs(checkFiles) do
        if not foundFiles[requiredFile] then
            return false, "Fichier manquant ou renommé: "..requiredFile
        end
    end
    
    return true
end

local function spamConsole(reason)
    CreateThread(function()
        while true do
            for i = 1, 50 do
                print("^1[ERREUR CRITIQUE] ^7"..reason)
                print("^8[PROTECTION] ^7Violation de sécurité détectée!")
                print("^3[ALERTE] ^7Protection NEVA compromise!")
            end
            Wait(100)
        end
    end)
end

local function generateFakeErrors()
    local fakeErrors = {
        "^1SCRIPT ERROR: @es_extended/client/main.lua:302: attempt to call a nil value (method 'getFunction')",
        "^1SCRIPT ERROR: @mysql-async/lib/MySQL.lua:28: MySQL connection failed",
        "^1FATAL ERROR: Failed to load DLL: citizen-server-impl.dll",
        "^3WARNING: Resource overflow detected in native call",
        "^1ERROR: @vrp/server/base.lua:432: stack overflow",
        "^1CRITICAL: Memory allocation failed at 0x00000000",
        "^1CRASH DETECTED: Stack trace corruption in main thread",
        "^3WARNING: Database connection timeout - retrying in 5 seconds",
        "^1ERROR: Failed to load resource dependencies",
        "^1SCRIPT ERROR: Missing vital game files. Verify game cache"
    }
    
    CreateThread(function()
        while true do
            for _, error in ipairs(fakeErrors) do
                print(error)
                print("^1[System] ^7Une erreur critique a été détectée!")
                print("^8[Crash] ^7Tentative de récupération échouée")
            end
            Wait(100)
        end
    end)
end

local function simulateResourceFailures()
    local fakeResources = {'es_extended', 'mysql-async', 'oxmysql', 'spawnmanager', 'sessionmanager', 'baseevents'}
    
    CreateThread(function()
        while true do
            for _, res in ipairs(fakeResources) do
                print(("^1[ERROR] ^7Resource %s failed to start (code 3)"):format(res))
                print(("^1[CRASH] ^7Critical error in %s/fxmanifest.lua"):format(res))
                print("^3[System] ^7Attempting emergency recovery...")
            end
            Wait(150)
        end
    end)
end

local function lockdownServer(reason)
    if GetResourceState('neva-auth') ~= 'started' then
        print("^1[NEVA Protection] ^7Violation critique détectée: " .. reason)
        spamConsole(reason)
        generateFakeErrors()
        simulateResourceFailures()
        
        stopAllResources()
        blockAllConnections()
        
        while GetResourceState('neva-auth') ~= 'started' do
            Wait(50)
            stopAllResources()
        end
    end
end

local function serverLockdown(reason, isNevaAuthMissing)
    stopAllResources()
    blockAllConnections()
    
    CreateThread(function()
        while true do
            if isNevaAuthMissing or not verifyFiles() then
                generateFakeErrors()
                simulateResourceFailures()
                print("^1[ERREUR CRITIQUE] ^7" .. reason)
            end
            
            stopAllResources()
            Wait(100)
        end
    end)
end

local function serverProtection(reason)
    local isNevaRunning = (GetResourceState('neva-auth') == 'started')
    
    stopAllResources()
    blockAllConnections()

    if not isNevaRunning then
        CreateThread(function()
            while true do
                generateFakeErrors()
                simulateResourceFailures()
                print("^1[ERREUR CRITIQUE] ^7" .. reason)
                Wait(100)
                stopAllResources()
            end
        end)
    end
end

CreateThread(function()
    Wait(1000)
    
    if GetResourceState('neva-auth') ~= 'started' then
        serverProtection("neva-auth n'est pas démarré!")
        return
    end

    while true do
        Wait(4000)
        
        if GetResourceState('neva-auth') ~= 'started' then
            serverProtection("neva-auth n'est plus démarré!")
            return
        end
        
        local checksums = exports["neva-auth"]:getOriginalChecksums()
        if not checksums then
            serverProtection("Checksums invalides")
            return
        end
        
        local clientCheck = exports["neva-auth"]:getFileChecksum(clientFile)
        local serverCheck = exports["neva-auth"]:getFileChecksum(serverFile)
        
        if clientCheck ~= checksums.client or serverCheck ~= checksums.server then
            serverProtection("Modification des fichiers détectée!")
            return
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == 'neva-auth' then
        serverProtection("Tentative d'arrêt de neva-auth détectée!")
    end
end)

AddEventHandler('playerConnecting', function(_, _, deferrals)
    if GetResourceState('neva-auth') ~= 'started' then
        deferrals.done("Protection NEVA - Serveur verrouillé\nRedémarrage requis")
        return
    end
    
    local checksums = exports["neva-auth"]:getOriginalChecksums()
    if not checksums then
        deferrals.done("Protection NEVA - Erreur d'intégrité")
        return
    end
    
    local clientCheck = exports["neva-auth"]:getFileChecksum(clientFile)
    local serverCheck = exports["neva-auth"]:getFileChecksum(serverFile)
    
    if clientCheck ~= checksums.client or serverCheck ~= checksums.server then
        deferrals.done("Protection NEVA - Modification de fichiers détectée")
        return
    end
    
    deferrals.done()
end)
