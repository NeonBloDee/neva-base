CreateThread(function()

    while not NetworkIsSessionStarted() do
        Citizen.Wait(0)
    end

	for _, relationshipGroup in ipairs(SunnyConfigServ.PNJ.RelationshipGroups) do
		SetRelationshipBetweenGroups(1, relationshipGroup, `PLAYER`)
	end

	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	for _, weapon in ipairs(SunnyConfigServ.PNJ.PickupWeapons) do
		ToggleUsePickupsForPlayer(Player.playerId, weapon, false)
	end
    DisableControlAction(0, 140, true)
    if IsPedArmed(PlayerPedId(), 4) then
        SetPlayerLockon(PlayerId(), false)
            else
        SetPlayerLockon(PlayerId(), true)
    end

	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCops(false)

	for _, model in pairs(SunnyConfigServ.PNJ.SuppressedVehiclesModels) do
		SetVehicleModelIsSuppressed(model, true)
	end

	for _, model in pairs(SunnyConfigServ.PNJ.SuppressedPedsModels) do
		SetPedModelIsSuppressed(model, true)
	end

    SetWeaponsNoAutoswap(true)

    SetMaxWantedLevel(0)
    SetPoliceIgnorePlayer(Player.playerId, true)
    SetDispatchCopsForPlayer(Player.playerId, false)
    SetPlayerHealthRechargeMultiplier(PlayerPedId(), 0.0)
    SetPedSuffersCriticalHits(Player.playerPed, false)
    DisablePlayerVehicleRewards(Player.playerId)
    DisableControlAction(0, 80, true)
    SetGarbageTrucks(0)
	SetRandomBoats(0)
	SetRandomTrains(0)

    SetRadarAsExteriorThisFrame()
    SetRadarAsInteriorThisFrame(`h4_fake_islandx`, vec(4700.0, -5145.0), 0, 0)

    SetPedCanBeDraggedOut(PlayerPedId(), false)
    local weapon = GetSelectedPedWeapon(Player.playerPed)

    if weapon == `WEAPON_PEPPERSPRAY` or weapon == `WEAPON_ANTIDOTE` then
    DisablePlayerFiring()
    SetPlayerLockon(PlayerId(), true)
    elseif weapon == `WEAPON_UNARMED` or GetWeaponDamageType(weapon) == 2 then
    SetPlayerLockon(PlayerId(), true)
    else
    SetPlayerLockon(PlayerId(), false)
    end
end)