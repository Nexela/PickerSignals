--Change the defaul roboport signals to the blue version if available
if data.raw['virtual-signal']['more-signals-active-log-bot-blue'] then
    for _, roboport in pairs(data.raw['roboport']) do
        roboport.default_available_logistic_output_signal = {type = 'virtual', name = 'more-signals-active-log-bot-blue'}
        roboport.default_total_logistic_output_signal = {type = 'virtual', name = 'more-signals-total-log-bot-blue'}
        roboport.default_available_construction_output_signal = {type = 'virtual', name = 'more-signals-active-cons-bot-blue'}
        roboport.default_total_construction_output_signal = {type = 'virtual', name = 'more-signals-total-cons-bot-blue'}
    end
end