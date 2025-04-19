SoundManager = {}

function SoundManager.PlaySound(soundName, volume)
    if not Config.UI.Sounds.Enabled then return end
    
    SendNUIMessage({
        type = "playSoundEffect",
        sound = soundName,
        volume = volume or Config.UI.Sounds.Volumes[soundName] or 0.3
    })
    
    if Config.UI.Sounds.Haptic and Config.UI.Sounds.Haptic.Enabled then
        local duration = Config.UI.Sounds.Haptic.Duration[soundName] or 100
        local intensity = Config.UI.Sounds.Haptic.Intensity[soundName] or 0.2
        
        SetControlShake(0, intensity * 255, duration)
    end
end

exports('PlaySound', function(soundName, volume)
    SoundManager.PlaySound(soundName, volume)
end)

return SoundManager
