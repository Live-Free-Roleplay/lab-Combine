RegisterNetEvent('lab-Combine:Combine')
AddEventHandler('lab-Combine:Combine', function(payload)
    if lib.progressBar({
        duration = 2000,
        label = 'Combining..',
        position = 'middle',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'amb@prop_human_parking_meter@male@base',
            clip = 'base'
        },
    }) then TriggerServerEvent('lab-Combine:CombineDone', payload) end
end)
