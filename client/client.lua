RegisterNetEvent('xchristmasrewards:openRewardDialog', function()
    local dialog = lib.inputDialog(Config.ChooseNumber, {
        {type = 'number', label = Config.Label, icon = Config.Icon, required = true, min = Config.From, max = Config.To}
    })

    if not dialog or not dialog[1] then
        lib.notify({type = 'error', description = Config.DidntChooseNumber})
        return
    end

    local chosenNumber = dialog[1]
    if chosenNumber < 1 or chosenNumber > 10 then
        lib.notify({type = 'error', description = Config.InvalidNumber})
        return
    end

    TriggerServerEvent('xchristmasrewards:giveReward', chosenNumber)
end)
