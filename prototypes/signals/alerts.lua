-------------------------------------------------------------------------------
--[[Alert Signals]] --
-------------------------------------------------------------------------------
--Based on "Speaker Signals", by "Aidan647"
--core\graphics 100x89

local names = {
    'ammo-icon-red',
    'danger-icon',
    'destroyed-icon',
    'electricity-icon-red',
    'electricity-icon-unplugged',
    'fluid-icon-red',
    'fuel-icon-red',
    'logistic-delivery',
    'no-building-material-icon',
    'no-storage-space-icon',
    'not-enough-construction-robots-icon',
    'not-enough-repair-packs-icon',
    'recharge-icon',
    'warning-icon',
    'too-far-from-roboport-icon'
}

local subgroup = 'more-signals-alerts'
local signals = {}

data:extend {
    {
        type = 'item-subgroup',
        name = subgroup,
        group = 'signals',
        order = 'm[more-signals]-alerts'
    }
}
for _, name in pairs(names) do
    signals[#signals + 1] = {
        type = 'virtual-signal',
        name = name,
        localised_name = {'signals-alerts.' .. name},
        icon = '__PickerSignals__/graphics/icons/signal/alerts/' .. name .. '.png',
        icon_size = 32,
        subgroup = subgroup,
        order = 'more-signals-a-alerts[' .. name .. ']'
    }
end
data:extend(signals)
