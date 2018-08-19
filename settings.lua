data:extend {
    {
        type = 'bool-setting',
        name = 'picker-signals-extra-numbers',
        setting_type = 'startup',
        default_value = true,
        order = '[picker-signals]-a-extras-0'
    },
    {
        type = 'bool-setting',
        name = 'picker-signals-extra-letters',
        setting_type = 'startup',
        default_value = true,
        order = '[picker-signals]-a-extras-a'
    },
    {
        type = 'bool-setting',
        name = 'picker-signals-power',
        setting_type = 'startup',
        default_value = true,
        order = '[picker-signals]-b-power'
    },
    {
        type = "bool-setting",
        name = "picker-better-lamp-colors",
        setting_type = "startup",
        default_value = true,
        order = "picker-signals-better-lamp-colors"
    }
}

--Color Settings
local colors = require('prototypes/signals/colors')
for _, name in pairs(colors) do
    data:extend {
        {
            type = 'bool-setting',
            name = 'picker-signals-' .. name,
            setting_type = 'startup',
            default_value = (name ~= 'blue' and true) or false,
            order = 'picker-signals-colors-' .. name
        }
    }
end
