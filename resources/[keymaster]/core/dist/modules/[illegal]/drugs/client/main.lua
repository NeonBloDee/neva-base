CreateThread(function()
    local loaded = false

    RegisterNetEvent('sunny:drugs:load', function(table)
        for k,v in pairs(table) do
            SunnyDrugs.Drugs[v.name] = {
                ["recolte"] = v.position.recolte,
                ["recolte1"] = v.position.recolte1,
                ["recolte2"] = v.position.recolte2,
                ["recolte3"] = v.position.recolte3,
                ["recolte4"] = v.position.recolte4,
                ["traitement"] = v.position.traitement
            }
            SunnyDrugs.Items[v.name] = {
                ["recolte"] = {
                    name = v.data.recolte.name,
                    label = v.data.recolte.label,
                    animtype = v.data.recolte.animtype,
                    animdict = v.data.recolte.animdict,
                    anim = v.data.recolte.anim,
                    animtime = v.data.recolte.animtime,
                    marker = v.data.recolte.marker,
                    props = v.data.recolte.props
                },
                ["recolte1"] = {
                    name = v.data.recolte1.name,
                    label = v.data.recolte1.label,
                    animtype = v.data.recolte1.animtype,
                    animdict = v.data.recolte1.animdict,
                    anim = v.data.recolte1.anim,
                    animtime = v.data.recolte1.animtime,
                    marker = v.data.recolte1.marker,
                    props = v.data.recolte1.props
                },
                ["recolte2"] = {
                    name = v.data.recolte2.name,
                    label = v.data.recolte2.label,
                    animtype = v.data.recolte2.animtype,
                    animdict = v.data.recolte2.animdict,
                    anim = v.data.recolte2.anim,
                    animtime = v.data.recolte2.animtime,
                    marker = v.data.recolte2.marker,
                    props = v.data.recolte2.props
                },
                ["recolte3"] = {
                    name = v.data.recolte3.name,
                    label = v.data.recolte3.label,
                    animtype = v.data.recolte3.animtype,
                    animdict = v.data.recolte3.animdict,
                    anim = v.data.recolte3.anim,
                    animtime = v.data.recolte3.animtime,
                    marker = v.data.recolte3.marker,
                    props = v.data.recolte3.props
                },
                ["recolte4"] = {
                    name = v.data.recolte4.name,
                    label = v.data.recolte4.label,
                    animtype = v.data.recolte4.animtype,
                    animdict = v.data.recolte4.animdict,
                    anim = v.data.recolte4.anim,
                    animtime = v.data.recolte4.animtime,
                    marker = v.data.recolte4.marker,
                    props = v.data.recolte4.props
                },
                ["traitement"] = {
                    name = v.data.traitement.name,
                    label = v.data.traitement.label,
                    animtype = v.data.traitement.animtype,
                    animdict = v.data.traitement.animdict,
                    anim = v.data.traitement.anim,
                    animtime = v.data.traitement.animtime,
                    marker = v.data.traitement.marker,
                    props = v.data.traitement.props
                }
            }

            TriggerServerEvent('sunny:drugs:addTable', SunnyDrugs.Items)
        end
    
        loaded = true
    end)

    RegisterNetEvent('sunny:drugs:refresh', function(d)
        for k,v in pairs(SunnyDrugs.Drugs) do
            if k ~= d then return end
            for i,p in pairs(SunnyDrugs.Drugs[k]) do
                for _,z in pairs(SunnyDrugs.Drugs[k][i]) do
                    SunnyDrugs.RandomZone[i..k] = SunnyDrugs.Drugs[k][i][math.random(1, #SunnyDrugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(SunnyDrugs.Drugs) do
            if _ ~= d then return end
            for k,v in pairs(SunnyDrugs.Drugs[_]) do
                if not SunnyDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(SunnyDrugs.Items[_][k].props, vector3(SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        SunnyDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
    end)
    
    Wait(1000)

    TriggerServerEvent('sunny:drugs:load')

    while not loaded do Wait(1) end

    function SunnyDrugs:drugs(item, type)
        Player.playerPed = PlayerPedId()
        local ped = Player.playerPed
    
        ClearPedTasksImmediately(Player.playerPed)
        FreezeEntityPosition(ped, true)
    
        if SunnyDrugs.Items[item][type].animtype == 'anim' then
            local dict, anim = SunnyDrugs.Items[item][type].animdict, SunnyDrugs.Items[item][type].anim
    
            ESX.Streaming.RequestAnimDict(dict)
            TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)
        else
            TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
        end
    
        Citizen.Wait(SunnyDrugs.Items[item][type].animtime)
    
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
    
        TriggerServerEvent('sunny:drugs:drugs', item, type)
    end
    
    function DeleteProps()
        for k,v in pairs(SunnyDrugs.objSpawn) do
            DeleteObject(v)
        end
    
        for _,z in pairs(SunnyDrugs.Drugs) do
            for k,v in pairs(SunnyDrugs.Drugs[_]) do
                if not SunnyDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(SunnyDrugs.Items[_][k].props, vector3(SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        SunnyDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
    
                ::continue::
            end
        end
    end
    
    CreateThread(function()
    
        for k,v in pairs(SunnyDrugs.Drugs) do
            for i,p in pairs(SunnyDrugs.Drugs[k]) do
                for _,z in pairs(SunnyDrugs.Drugs[k][i]) do
                    SunnyDrugs.RandomZone[i..k] = SunnyDrugs.Drugs[k][i][math.random(1, #SunnyDrugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(SunnyDrugs.Drugs) do
            for k,v in pairs(SunnyDrugs.Drugs[_]) do
                if not SunnyDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(SunnyDrugs.Items[_][k].props, vector3(SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        SunnyDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
        
        while true do 
            Wait(SunnyDrugs.Wait)
            SunnyDrugs.Wait = 2000
            
            for _,z in pairs(SunnyDrugs.Drugs) do
                for k,v in pairs(SunnyDrugs.Drugs[_]) do
                    local distance = #(GetEntityCoords(PlayerPedId())-vector3(SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z))
    
                    if distance > 20 then goto continue end
    
                    SunnyDrugs.Wait = 1
    
                    if SunnyDrugs.Items[_][k].marker then
                        DrawMarker(21, SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
                    end
    
                    if distance < 1.5 then
                        DrawInstructionBarNotification(SunnyDrugs.RandomZone[k.._].x, SunnyDrugs.RandomZone[k.._].y, SunnyDrugs.RandomZone[k.._].z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                        if IsControlJustPressed(1,51) then
                            SunnyDrugs:drugs(_, k)
                            SunnyDrugs.RandomZone[k.._] = SunnyDrugs.Drugs[_][k][math.random(1, #SunnyDrugs.Drugs[_][k])]
    
                            if not SunnyDrugs.Items[_][k].marker then
                                DeleteProps()
                            end
                        end
                    end
    
                    ::continue::
                end
            end
        end
    end)
    
    AddEventHandler('onResourceStop', function()
        for k,v in pairs(SunnyDrugs.objSpawn) do
            DeleteObject(v)
            SunnyDrugs.objSpawn[k] = nil
        end
    end)
end)