DM = nil
TriggerEvent('esx:getSharedObject', function(object)
    DM = object
end)

local Items = {
    {name = 'phone', tedad = 1},
    {name = 'water', tedad = 3},
    {name = 'bread', tedad = 3},
}


RegisterCommand('kits', function(s, a, i)
    local xp=DM.GetPlayerFromId(s)
    if xp then
        TriggerClientEvent('open:dmmenu', s)
    end
end)

RegisterNetEvent('set:kits:starter')
AddEventHandler('set:kits:starter', function()
    local src = source
    local xp = DM.GetPlayerFromId(src)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xp.identifier
	}, function(rs)
        if rs[1].kits == 0 then
            TriggerClientEvent('chatMessage', src, '[KITS]', {255, 0, 0}, '^2Shoma Starter Pack Khod Ra Daryaft Kardid !')
            xp.addMoney(2000000)
            for w = 1, #Items do 
                xp.addInventoryItem(Items[w].name, Items[w].tedad)
            end
            MySQL.Async.execute('UPDATE users SET kits = @kit WHERE identifier = @identifier', {
				['@identifier'] = xp.identifier,
				['@kit'] = 1
			})
        elseif rs[1].kits == 1 then
            TriggerClientEvent('chatMessage', src, '[KITS]', {255, 0, 0}, '^1Shoma Starter Pack Khod Ra Ghablan Daryaft Kardid !')
        end
	end)
end)