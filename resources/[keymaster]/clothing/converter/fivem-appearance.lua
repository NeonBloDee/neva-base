local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_fivem-appearance_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('getPedModel', function()
    return reloadSkin()
end)

exportHandler('getPedComponents', function()
    return reloadSkin()
end)

exportHandler('getPedProps', function()
    return reloadSkin()
end)

exportHandler('getPedHeadBlend', function()
    return reloadSkin()
end)

exportHandler('getPedFaceFeatures', function()
    return reloadSkin()
end)

exportHandler('getPedHeadOverlays', function()
    return reloadSkin()
end)

exportHandler('getPedHair', function()
    return reloadSkin()
end)

exportHandler('getPedTattoos', function()
    return reloadSkin()
end)

exportHandler('getPedAppearance', function()
    return reloadSkin()
end)

exportHandler('setPlayerModel', function()
    return reloadSkin()
end)

exportHandler('setPedComponent', function()
    return reloadSkin()
end)

exportHandler('setPedComponents', function()
    return reloadSkin()
end)

exportHandler('setPedProp', function()
    return reloadSkin()
end)

exportHandler('setPedProps', function()
    return reloadSkin()
end)

exportHandler('setPedFaceFeatures', function()
    return reloadSkin()
end)

exportHandler('setPedHeadOverlays', function()
    return reloadSkin()
end)

exportHandler('setPedHair', function()
    return reloadSkin()
end)

exportHandler('setPedEyeColor', function()
    return reloadSkin()
end)

exportHandler('setPedTattoos', function()
    return reloadSkin()
end)

exportHandler('setPlayerAppearance', function()
    return reloadSkin()
end)

exportHandler('setPedAppearance', function()
    return reloadSkin()
end)

exportHandler('startPlayerCustomization', function()
    return createFirstCharacter("male", Config.CharacterCreationMenuCategories.Normal, true, true)
end)