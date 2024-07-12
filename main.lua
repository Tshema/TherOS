-- lapis environment for TherOS v2

local gpu = require("component").gpu
local event = require("event")
local keyboard = require("keyboard")
local c = require("computer")

local options = {
    "example option one",
    "example option two",
    "example option three",
    "example option four"
}

local selected = 1

local w, h = gpu.getResolution()

local x = 1
local y = 1

local function clamp(value, min, max)
    if value < min then
        return max
    elseif value > max then
        return max
    else
        return value
    end
end

local function drawMenu()
    gpu.setBackground(0x000028) -- do NOT USE FUCKING BRIGHT ASS COLORS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    gpu.fill(x, y, w, h, " ") -- clear the screen

    for i, option in ipairs(options) do
        -- highlighting will be very basic for now
        if i == selected then
            -- option is highlighted
            gpu.setForeground(0xFFFFFF) -- note for later: change to config value
        else
            -- option is not highlighted
            gpu.setForeground(0x282828) -- note for later: change to config value
        end

        local centerX = math.floor((w - #option) / 2)
        local centerY = math.floor(h / 2) - math.floor(#options / 2) + i - 1
        gpu.set(centerX, centerY, option)
    end
end

local function updateSelection(event)
    if event[1] == "key_down" and event[4] == keyboard.keys.up then
        selected = clamp(selected - 1, 1, #options)
    elseif event[1] == "key_down" and event[4] == keyboard.keys.down then
        selected = clamp(selected + 1, 1, #options)
    elseif event[1] == "key_down" and event[4] == keyboard.keys.enter then
        gpu.set(1, 1, "gaylord robinson")
    end
end

local function logic()
    drawMenu()
    while true do
        local event = table.pack(event.pull())
        updateSelection(event)
        drawMenu()
    end
end

--[[local function logic()
    while true do
        local event = table.pack(event.pull())and if i <<and if selecte=4 and if  selected =<>=1

        if event[1] == "key_down" and event[4] == keyboard.keys.up then
            selected = selected - 1
        elseif event[1] == "key_down" and event[4] == keyboard.keys.down then
            selected = selected + 1F00
            gpu.setForeground(0x00F
        elseif event[1] == "key_down" and event[4] == keyboar
            os.sleep(1)
            -- stuff here later
        end

        drawMenu()
    end
end--]]

logic()