-------------------------------------------------------------------------------
--[[Expanded Color Lamps]] --
-------------------------------------------------------------------------------
-- From: "Expanded Color Lamps", by: "Klonan"

local Data = require('__stdlib__/data/data')
local Color = require('__stdlib__/color/color')

if not settings.startup['picker-better-lamp-colors'].value then
    return
end

local colors = {
    {type = 'virtual', name = 'signal-white', color = Color.from_rgb(255, 255, 255)},
    {type = 'virtual', name = 'signal-light-grey', color = Color.from_rgb(228, 228, 228)},
    {type = 'virtual', name = 'signal-grey', color = Color.from_rgb(136, 136, 136)},
    {type = 'virtual', name = 'signal-black', color = Color.from_rgb(34, 34, 34)},
    {type = 'virtual', name = 'signal-pink', color = Color.from_rgb(255, 167, 209)},
    {type = 'virtual', name = 'signal-red', color = Color.from_rgb(229, 0, 0)},
    {type = 'virtual', name = 'signal-orange', color = Color.from_rgb(229, 149, 0)},
    {type = 'virtual', name = 'signal-brown', color = Color.from_rgb(160, 106, 66)},
    {type = 'virtual', name = 'signal-yellow', color = Color.from_rgb(229, 217, 0)},
    {type = 'virtual', name = 'signal-light-green', color = Color.from_rgb(148, 224, 68)},
    {type = 'virtual', name = 'signal-green', color = Color.from_rgb(2, 190, 1)},
    {type = 'virtual', name = 'signal-cyan', color = Color.from_rgb(0, 211, 221)},
    {type = 'virtual', name = 'signal-light-blue', color = Color.from_rgb(0, 131, 199)},
    {type = 'virtual', name = 'signal-blue', color = Color.from_rgb(0, 0, 234)},
    {type = 'virtual', name = 'signal-light-purple', color = Color.from_rgb(207, 110, 228)},
    {type = 'virtual', name = 'signal-dark-purple', color = Color.from_rgb(130, 0, 128)}
}

-- Remove the default signal colors.
for name, signal in pairs(data.raw['virtual-signal']) do
    if signal.order and signal.order:find('^d%[colors%]') then
        data.raw['virtual-signal'][name] = nil
    end
end

local signals = {}
for _, signal in pairs(colors) do
    signals[#signals + 1] = {
        type = 'virtual-signal',
        name = signal.name,
        icons = {
            {
                icon = '__base__/graphics/icons/signal/signal_grey.png',
                icon_size = 32,
                tint = signal.color
            }
        },
        icon_size = 32,
        subgroup = 'virtual-signal-color',
        order = 'd[colors]-[' .. signal.name .. ']'
    }
end
data:extend(signals)

local lamp = Data('small-lamp', 'lamp')
lamp.light_when_colored.size = 0 --6
lamp.light_when_colored.intensity = 0 --1
lamp.glow_render_mode = 'multiplicative' --nil
lamp.glow_size = 25 --6
lamp.glow_color_intensity = 0.8 --0.135
lamp.signal_to_color_mapping = colors
