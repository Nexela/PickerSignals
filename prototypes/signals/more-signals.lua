-------------------------------------------------------------------------------
--[[More Signals]] --
-------------------------------------------------------------------------------
local colors = require('prototypes/signals/colors')

local names = {
    'total-log-bot',
    'active-log-bot',
    'total-cons-bot',
    'active-cons-bot',
    'total',
    'min',
    'max',
    'average',
    'top',
    'bottom',
    'left',
    'right',
    'buffer',
    'difference',
    'empty',
    'full',
    'in',
    'out',
    'on',
    'off',
    'stored',
    'target',
    'ingredient-1',
    'ingredient-2',
    'ingredient-3',
    'ingredient-4'
}

local numbers = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}

local letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}

for _, color in pairs(colors) do
    if settings.startup['picker-signals-' .. color].value then
        local subgroup = 'more-signals-' .. color
        local signals = {}

        if color ~= 'blue' then
            if not data.raw['item-group']['more-signals'] then
                local group = util.table.deepcopy(data.raw['item-group']['signals'])
                group.name = 'more-signals'
                group.order = group.order .. group.order
                data:extend {group}
            end
        end

        data:extend {
            {
                type = 'item-subgroup',
                name = subgroup,
                group = (color == 'blue' and 'signals') or 'more-signals',
                order = 'm[more-signals]-' .. color
            }
        }

        if color ~= 'blue' and settings.startup['picker-signals-extra-numbers'].value then
            for _, number in pairs(numbers) do
                signals[#signals + 1] = {
                    type = 'virtual-signal',
                    name = 'more-signals-' .. number .. '-' .. color,
                    localised_name = {'virtual-signal-name.more-signals', {'signals-color.' .. color}, {'virtual-signal-name.signal-' .. number}},
                    icons = {
                        {
                            icon = '__base__/graphics/icons/signal/signal_' .. color .. '.png',
                            icon_size = 32
                        },
                        {
                            icon = '__PickerSignals__/graphics/icons/signal/numbers/signal_' .. number .. '.png',
                            icon_size = 32
                        }
                    },
                    icon_size = 32,
                    subgroup = subgroup,
                    order = 'more-signals-c[' .. color .. ']-a-[' .. number .. ']'
                }
            end
        end
        if color ~= 'blue' and settings.startup['picker-signals-extra-letters'].value then
            for _, letter in pairs(letters) do
                signals[#signals + 1] = {
                    type = 'virtual-signal',
                    name = 'more-signals-' .. letter .. '-' .. color,
                    localised_name = {'virtual-signal-name.more-signals', {'signals-color.' .. color}, {'virtual-signal-name.signal-' .. letter}},
                    icons = {
                        {
                            icon = '__base__/graphics/icons/signal/signal_' .. color .. '.png',
                            icon_size = 32
                        },
                        {
                            icon = '__PickerSignals__/graphics/icons/signal/letters/signal_' .. letter .. '.png',
                            icon_size = 32
                        }
                    },
                    icon_size = 32,
                    subgroup = subgroup,
                    order = 'more-signals-c[' .. color .. ']-b-[' .. letter .. ']'
                }
            end
        end

        for _, name in pairs(names) do
            signals[#signals + 1] = {
                type = 'virtual-signal',
                name = 'more-signals-' .. name .. '-' .. color,
                localised_name = {'virtual-signal-name.more-signals', {'signals-color.' .. color}, {'signals-more.' .. name}},
                icons = {
                    {
                        icon = '__base__/graphics/icons/signal/signal_' .. color .. '.png',
                        icon_size = 32
                    },
                    {
                        icon = '__PickerSignals__/graphics/icons/signal/more/' .. name .. '.png',
                        icon_size = 32
                    }
                },
                icon_size = 32,
                subgroup = subgroup,
                order = 'more-signals-c[' .. color .. ']-c-[' .. name .. ']'
            }
        end

        data:extend(signals)
    end
end
