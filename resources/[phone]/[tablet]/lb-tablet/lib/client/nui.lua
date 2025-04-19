---@param event string
---@param callback fun(data: any) : ...
---@param defaultReturn any
function ReactCallback(event, callback, defaultReturn)
    if defaultReturn == nil then
        defaultReturn = false
    end

    RegisterNUICallback(event, function(data, nuiCallback)
        local eventTitle = event

        if type(data) == "table" then
            if data.action then
                eventTitle = event .. ":" .. data.action
            end

            if data.data then
                for k, v in pairs(data.data) do
                    data[k] = data[k] or v
                end
            end
        end

        local startTime = GetGameTimer()
        local result = callback(data)
        local finishTime = GetGameTimer()
        local ms = finishTime - startTime

        if result == nil then
            result = defaultReturn
        end

        nuiCallback(result)

        debugprint(("NUI callback ^5%s^7 took %ims"):format(eventTitle, ms))
    end)
end

---@param action string
---@param data any
function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end
