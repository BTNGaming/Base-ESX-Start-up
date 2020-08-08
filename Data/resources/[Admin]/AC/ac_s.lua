Components = {																			-- Toggleable Components
	Health = true,
	Weapon = true,
	Vehicle = true,
}

local events = {																		-- Server Trigger Events that are detected
  'esx_truckerjob:pay',
  'esx_joblisting:setJob',
  'esx_ambulancejob:revive',
  'esx_policejob:handcuff',
  'esx_policejob:OutVehicle',
  'esx_weashop:buyItem',
  'esx_vehicleshop:putStockItems',
  'esx_slotmachine:sv:2',
  'AdminMenu:giveCash',
  'AdminMenu:giveBank',
  'AdminMenu:giveDirtyMoney',
  'NB:recruterplayer',
  'MWGAC:SetAllComponents',
  'anticheese:SetAllComponents',
}

Users = {}
violations = {}

RegisterServerEvent('613cd851-bb4c-4825-8d4a-423caa7bf2c3')
AddEventHandler('613cd851-bb4c-4825-8d4a-423caa7bf2c3', function(name)					-- Trigger Event Handler
  local _source = source
  TriggerEvent('MWGAC:InjectionDetected', name, _source, false)
end)

for i=1, #events, 1 do																	-- Detects if a Blacklisted Event Was Triggered
  RegisterServerEvent(events[i])
  AddEventHandler(events[i], function()
    local _source = source
    TriggerEvent('MWGAC:InjectionDetected', events[i], _source, true)
  end)
 end

 Citizen.CreateThread(function()
	webhook = "https://discordapp.com/api/webhooks/736103250796740639/rxapF07MfvqYfqYt02lT4y54iCVUBU2nSbI03Wq8UYtZg1eqdnotLZo4qc1ZeCQQ5pZW"


	function SendWebhookMessage(webhook,message)										-- Webhook Event
		if webhook ~= "none" then
			PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
		end
	end

	
	function GetPlayerNeededIdentifiers(player)											-- Get Player Idents
		local ids = GetPlayerIdentifiers(player)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			end
		end
		if not steam then
			steam = "steam: missing"
		end
		return license, steam
	end


	RegisterServerEvent('MWGAC:InjectionDetected')									-- Injection Event Flag
	AddEventHandler('MWGAC:InjectionDetected', function(name, source, isServerEvent)

  local eventType = 'Client'
  license, steam = GetPlayerNeededIdentifiers(source)
			username = GetPlayerName(source)
			id = source
  
  if isServerEvent then
    eventType = 'Server'
  end

  SendWebhookMessage(webhook,"**INJECTION DETECTED** \n```\nUser:"..username.."\nId:"..id.."\n"..license.."\n"..steam.."\nAttempted to Execute: "..name.."\nEvent Type: "..eventType.."\n```")
  end)

  
	RegisterServerEvent('MWGAC:HealthFlag')											-- Health Event Flag
	AddEventHandler('MWGAC:HealthFlag', function(invincible,oldHealth, newHealth, curWait)
		if Components.Health and not IsPlayerAceAllowed(source,"anticheat.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			if invincible then
				SendWebhookMessage(webhook,"**Health Hack!** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nRegenerated "..newHealth-oldHealth.."hp ( to reach "..newHealth.."hp ) in "..curWait.."ms! ( PlayerPed was invincible )\n```")
			else
				SendWebhookMessage(webhook,"**Health Hack!** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nRegenerated "..newHealth-oldHealth.."hp ( to reach "..newHealth.."hp ) in "..curWait.."ms! ( Health was Forced )\n```")
			end
		end
	end)

	
	RegisterServerEvent('MWGAC:WeaponFlag')											-- Weapon Event Flag
	AddEventHandler('MWGAC:WeaponFlag', function(theWeapon)
		if Components.Weapon and not IsPlayerAceAllowed(source,"anticheat.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			SendWebhookMessage(webhook,"**Blacklisted Weapon!** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nGot Weapon: "..theWeapon.."( Blacklisted )\n```")
		end
	end)


	RegisterServerEvent('MWGAC:VehicleFlag')										-- Vehicle Event Flag
	AddEventHandler('MWGAC:VehicleFlag', function(carModel,car)
		if Components.Vehicle and not IsPlayerAceAllowed(source,"anticheatveh.bypass") then
			license, steam = GetPlayerNeededIdentifiers(source)
			name = GetPlayerName(source)
			local id = source

			TriggerClientEvent('MWGAC:Delete', source, car)
			SendWebhookMessage(webhook,"**Blacklisted Vehicle!** \n```\nUser:"..name.."\nId:"..id.."\n"..license.."\n"..steam.."\nEntered Vehicle: "..carModel.." ( Blacklisted )\n```")
		end
	end)
end)
