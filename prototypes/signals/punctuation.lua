-------------------------------------------------------------------------------
--[[Punctuation]] --
-------------------------------------------------------------------------------
local colors = require('prototypes/signals/colors')
local names = {
    'ampersand',
    'arobase',
    'asterisk',
    'back-quote',
    'back-slash',
    'clock',
    'colon',
    'comma',
    'crunch-bang',
    'dash',
    'double-bang',
    'double-quote',
    'exclamation-point',
    'forward-slash',
    'interrobang',
    'left-curly-bracket',
    'left-parenthesis',
    'left-square-bracket',
    'period',
    'pound-sign',
    'question-mark',
    'right-curly-bracket',
    'right-parenthesis',
    'right-square-bracket',
    'semicolon',
    'single-quote',
    'tilde',
    'underscore',
    'vertical-break'
}

for _, color in pairs(colors) do
    if settings.startup['picker-signals-' .. color].value then
        local subgroup = 'more-signals-' .. color
        local signals = {}
        for _, name in pairs(names) do
            signals[#signals + 1] = {
                type = 'virtual-signal',
                name = name .. '-' .. color,
                localised_name = {'virtual-signal-name.more-signals', {'signals-color.' .. color}, {'signals-punctuation.' .. name}},
                icons = {
                    {
                        icon = '__base__/graphics/icons/signal/signal_' .. color .. '.png',
                        icon_size = 32
                    },
                    {
                        icon = '__PickerSignals__/graphics/icons/signal/punctuation/' .. name .. '.png',
                        icon_size = 32
                    }
                },
                icon_size = 32,
                subgroup = subgroup,
                order = 'more-signals-f-punctuation[' .. color .. ']-[' .. name .. ']'
            }
        end
        data:extend(signals)
    end
end
