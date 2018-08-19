-------------------------------------------------------------------------------
--[[Expanded Color Lamps]] --
-------------------------------------------------------------------------------
-- From: "Expanded Color Lamps", by: "Klonan"
local function RGB(r, g, b)
    return {r = r / 255, g = g / 255, b = b / 255}
end

if not settings.startup['picker-better-lamp-colors'].value then
    return
end

local colors = {
    {type = 'virtual', name = 'signal-white', color = RGB(255, 255, 255)},
    {type = 'virtual', name = 'signal-light-grey', color = RGB(228, 228, 228)},
    {type = 'virtual', name = 'signal-grey', color = RGB(136, 136, 136)},
    {type = 'virtual', name = 'signal-black', color = RGB(34, 34, 34)},
    {type = 'virtual', name = 'signal-pink', color = RGB(255, 167, 209)},
    {type = 'virtual', name = 'signal-red', color = RGB(229, 0, 0)},
    {type = 'virtual', name = 'signal-orange', color = RGB(229, 149, 0)},
    {type = 'virtual', name = 'signal-brown', color = RGB(160, 106, 66)},
    {type = 'virtual', name = 'signal-yellow', color = RGB(229, 217, 0)},
    {type = 'virtual', name = 'signal-light-green', color = RGB(148, 224, 68)},
    {type = 'virtual', name = 'signal-green', color = RGB(2, 190, 1)},
    {type = 'virtual', name = 'signal-cyan', color = RGB(0, 211, 221)},
    {type = 'virtual', name = 'signal-light-blue', color = RGB(0, 131, 199)},
    {type = 'virtual', name = 'signal-blue', color = RGB(0, 0, 234)},
    {type = 'virtual', name = 'signal-light-purple', color = RGB(207, 110, 228)},
    {type = 'virtual', name = 'signal-dark-purple', color = RGB(130, 0, 128)}
}

for name, signal in pairs(data.raw['virtual-signal']) do
    if signal.order:find('colors') then
        data.raw['virtual-signal'][name] = nil
    end
end

for _, signal in pairs(colors) do
    data:extend {
        {
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
    }
end

local lamp = data.raw.lamp['small-lamp']
lamp.glow_size = 25
lamp.glow_color_intensity = 0.8
lamp.glow_render_mode = 'multiplicative'
lamp.signal_to_color_mapping = colors
lamp.light_when_colored.size = 0
lamp.light_when_colored.intensity = 0
