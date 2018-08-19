-------------------------------------------------------------------------------
--[[Power Signals]] --
-------------------------------------------------------------------------------

local names = {
    'charge',
    'clock',
    'core',
    'fluid',
    'halt',
    'overheat',
    'power',
    'reset',
    'throttle'
}

local subgroup = 'more-signals-power'
local signals = {}

data:extend {
    {
        type = 'item-subgroup',
        name = subgroup,
        group = 'signals',
        order = 'm[more-signals]-power'
    }
}

for _, name in pairs(names) do
    signals[#signals + 1] = {
        type = 'virtual-signal',
        name = name,
        localised_name = {'signals-power.' .. name},
        icon = '__PickerSignals__/graphics/icons/signal/power/' .. name .. '.png',
        icon_size = 32,
        subgroup = subgroup,
        order = 'more-signals-a-power[' .. name .. ']'
    }
end
data:extend(signals)
