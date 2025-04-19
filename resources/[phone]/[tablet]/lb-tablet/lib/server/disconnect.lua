local disconnectCallbacks = {}

---@param cb fun(tabletId: string, source: number)
function OnDisconnect(cb)
    assert(type(cb) == "function", "Invalid argument #1 (function expected), got: " .. type(cb))

    disconnectCallbacks[#disconnectCallbacks+1] = cb
end

---@param source number
function PlayerLoggedOut(source)
    local tabletId = GetEquippedTablet(source)

    if not tabletId then
        return
    end

    for i = 1, #disconnectCallbacks do
        Citizen.CreateThreadNow(function()
            disconnectCallbacks[i](tabletId, source)
        end)
    end
end

AddEventHandler("playerDropped", function()
    PlayerLoggedOut(source)
end)
