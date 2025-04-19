---@type { [string]: true }
local registeredCallbacs = {}

---@param event string
---@param handler fun(source: number, ...) : any
function RegisterCallback(event, handler)
    assert(type(event) == "string", "event must be a string")
    assert(registeredCallbacs[event] == nil, ("event '%s' is already registered"):format(event))

    RegisterNetEvent("lb-tablet:cb:" .. event, function(requestId, ...)
        local src = source
        local params = { ... }
        local startTime = os.nanotime()

        local success, errorMessage = pcall(function()
            TriggerClientEvent("lb-tablet:cb:response", src, requestId, handler(src, table.unpack(params)))

            local finishTime = os.nanotime()
            local ms = (finishTime - startTime) / 1e6

            debugprint(("Callback ^5%s^7 took %.4fms"):format(event, ms))
        end)

        if not success then
            local stackTrace = Citizen.InvokeNative(`FORMAT_STACK_TRACE` & 0xFFFFFFFF, nil, 0, Citizen.ResultAsString())

            print(("^1SCRIPT ERROR: Callback '%s' failed: %s^7\n%s"):format(event, errorMessage or "", stackTrace or ""))
            TriggerClientEvent("lb-tablet:cb:response", src, requestId, nil)
        end
    end)
end

exports("RegisterCallback", RegisterCallback)

---@param event string
---@param callback fun(source: number, tabletId: string, ...) : any
---@param defaultReturn any
function BaseCallback(event, callback, defaultReturn)
    RegisterCallback(event, function(source, ...)
        local tabletId = GetEquippedTablet(source)

        if not tabletId then
            debugprint(("^1%s^7: no tablet found for %s | %s"):format(event, GetPlayerName(source), source))
            return defaultReturn
        end

        return callback(source, tabletId, ...)
    end)
end

exports("BaseCallback", BaseCallback)
