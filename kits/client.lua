DM = nil
CreateThread(function()
    while DM == nil do
        TriggerEvent('esx:getSharedObject', function(object)
            DM = object
        end)
    end
end)

RegisterNetEvent('open:dmmenu')
AddEventHandler('open:dmmenu', function()
    OpenKitsmNeu()
end)

OpenKitsmNeu = function()
    local labels = {
        {label = 'Starter Pack', value = '1'},
        {label = 'Made By ^Dm#0147', value = 'dmontop'},
    }

    DM.UI.Menu.Open('default', GetCurrentResourceName(), 'kitsmenu', {
        title = 'Kits',
        align = 'center',
        elements = labels
    }, function(d, m)
        if d.current.value == '1' then
            TriggerServerEvent('set:kits:starter')
            m.close()
        end
    end, function(d, m)
        m.close()
    end)
end
