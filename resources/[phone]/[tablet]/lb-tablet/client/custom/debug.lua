if not Config.Debug then
    return
end

local dispatchId = 0

RegisterCommand("adddispatch", function()
    dispatchId += 1

    ---@type DispatchNotification
    local data = {
        job = "police",
        id = dispatchId,
        priority = "high",
        title = "Bank robbery",
        description = "The Pacific Standard Bank is being robbed",
        code = "10-31",
        image = "https://r2.fivemanage.com/image/FQ6AXQrF7WNZ.webp",
        -- timestamp = os.time(),
        location = {
            label = "Pacific Standard Bank",
            coords = GenerateRandomCoords()
        },
        time = 600
    }

    TriggerServerEvent("tablet:addDispatch", data)

    -- print("ID: " .. dispatchId)

    -- TriggerEvent("tablet:addDispatch", data)
end, false)

RegisterCommand("removedispatch", function(_, args)
    local id = args[1]

    if id and tonumber(id) then
        TriggerEvent("tablet:police:removeDispatch", tonumber(id))
    end
end, false)

RegisterCommand("toggledispatch", function()
    local visible = exports["lb-tablet"]:IsDispatchVisible()

    exports["lb-tablet"]:ToggleDispatchVisible(not visible)
end, false)

function GenerateRandomCoords()
    local x = math.random(-4000, 4000)
    local y = math.random(-4000, 4000)

    return vector2(x, y)
end

RegisterCommand("popup", function()
    exports["lb-tablet"]:SetPopUp({
        title = "title",
        description = "description",
        buttons = {
            {
                title = "OK",
                cb = function(data)
                    print("ok")
                    print("Input: " .. tostring(data.inputs[1]))
                    print("TextArea: " .. tostring(data.textareas[1]))
                end
            }
        },
        inputs = {
            {
                -- onChange = function(value)
                --     print(value)
                -- end
            }
        },
        textareas = {
            {
                -- onChange = function(value)
                --     print(value)
                -- end
            }
        },
        close = function()
            print("closed popup")
        end
    })
end, false)

RegisterCommand("contextmenu", function()
    exports["lb-tablet"]:SetContextMenu({
        title = "test",
        buttons = {
            {
                title = "test",
                cb = function()
                    print("test")
                end
            },
            {
                title = "test 2",
                cb = function()
                    print("test 2")
                end
            }
        },
        close = function()
            print("closed context menu")
        end
    })
end, false)

RegisterCommand("gallery", function()
    exports["lb-tablet"]:Gallery({
        includeVideos = true,
        includeImages = true,
        allowExternal = true,
        multiSelect = true,
        onSelect = function(data)
            debugprint(data)
        end,
        close = function()
            print("closed gallery")
        end
    })
end, false)

RegisterCommand("colorpicker", function()
    exports["lb-tablet"]:ColorPicker({
        defaultColor = "#ff0000",
        onSelect = function(color)
            print(color)
        end,
        onClose = function(color)
            print("Selected color: " .. color)
        end,
        close = function()
            print("closed color picker")
        end
    })
end, false)
