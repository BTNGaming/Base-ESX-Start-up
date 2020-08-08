
BlacklistedWeapons = { 						-- Weapons that are detected
"WEAPON_SNSPISTOL",
"WEAPON_VINTAGEPISTOL",
"WEAPON_COMBATPDW",
"WEAPON_MACHINEPISTOL",
"WEAPON_MG",
"WEAPON_GUSENBERG",
"WEAPON_BULLPUPRIFLE",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_DBSHOTGUN",
"WEAPON_MUSKET",
"WEAPON_HEAVYSNIPER",
"WEAPON_MARKSMANRIFLE",
"WEAPON_FIREWORK",
"WEAPON_MINIGUN",
"WEAPON_GRENADELAUNCHER",
"WEAPON_COMPACTLAUNCHER",
"WEAPON_RPG",
"WEAPON_STINGER",
"WEAPON_HOMINGLAUNCHER",
"WEAPON_RAILGUN",
"WEAPON_MOLOTOV",
"WEAPON_PROXMINE",
"WEAPON_STICKYBOMB",
"WEAPON_GRENADE",
"WEAPON_GARBAGEBAG",
"GADGET_NIGHTVISION",
}

BlacklistedVehicles = { 					-- Vehicles that are detected
"rhino",
"hyrda",
"ruiner2",
"dune4",
"dune5",
"phantom2",
"voltic2",
"boxville5",
"technical2",
"nightshark",
"technical3",
"insurgent3",
"apc",
"dune3",
"halftrack",
"oppressor",
"hunter",
"vigilante",
"akula",
"barrage",
"chernobog",
"deluxo",
"avenger",
"avenger2",
"thruster",
"stromberg",
"khanjali",
"insurgent",
}

CageObjs = {								-- Cage Objects that are detected used to prevent griefing.
"prop_gold_cont_01",
"p_cablecar_s",
"stt_prop_stunt_tube_l",
"stt_prop_stunt_track_dwuturn",
}

local events = {							-- Trigger Events that are detected
'esx_society:openBossMenu',
'esx_ambulancejob:revive',
'esx:spawnVehicle',
'mellotrainer:adminKick',
'mellotrainer:adminTempBan',
'mellotrainer:s_adminKill',
}

Citizen.CreateThread(function()				-- Health Flags
while true do
	Citizen.Wait(60000)
	local curPed = PlayerPedId()
	local curHealth = GetEntityHealth( curPed )
	SetEntityHealth( curPed, curHealth-2)
	local curWait = math.random(10,150)
	Citizen.Wait(curWait)

	if not IsPlayerDead(PlayerId()) then
		if PlayerPedId() == curPed and GetEntityHealth(curPed) == curHealth and GetEntityHealth(curPed) ~= 0 then
			TriggerServerEvent("MWGAC:HealthFlag", false, curHealth-2, GetEntityHealth( curPed ),curWait )
		elseif GetEntityHealth(curPed) == curHealth-2 then
			SetEntityHealth(curPed, GetEntityHealth(curPed)+2)
		end
	end
	if GetEntityHealth(curPed) > 400 then
		TriggerServerEvent("MWGAC:HealthFlag", false, GetEntityHealth( curPed )-200, GetEntityHealth( curPed ),curWait )
	end

	if GetPlayerInvincible( PlayerId() ) then
		TriggerServerEvent("MWGAC:HealthFlag", true, curHealth-2, GetEntityHealth( curPed ),curWait )
	end
end
end)

Citizen.CreateThread(function()				-- Weapon Flags
while true do
	Citizen.Wait(120000)
	local weapon = theWeapon
	for _,theWeapon in ipairs(BlacklistedWeapons) do
		Wait(1)
		if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
				TriggerServerEvent("MWGAC:WeaponFlag", theWeapon )
		end
	end
end
end)

function ReqAndDelete(object, detach)		-- Delete Attached Object Function
if DoesEntityExist(object) then
	NetworkRequestControlOfEntity(object)
	while not NetworkHasControlOfEntity(object) do
		Citizen.Wait(1)
	end
	if detach then
		DetachEntity(object, 0, false)
	end
	SetEntityCollision(object, false, false)
	SetEntityAlpha(object, 0.0, true)
	SetEntityAsMissionEntity(object, true, true)
	SetEntityAsNoLongerNeeded(object)
	DeleteEntity(object)
end
end

Citizen.CreateThread(function()				-- Does Ped Have Object Attached
while true do
	Citizen.Wait(500)
	local ped = PlayerPedId()
	local handle, object = FindFirstObject()
	local finished = false
	repeat
		Wait(1)
		if IsEntityAttached(object) and DoesEntityExist(object) then
			if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
				ReqAndDelete(object, true)
			end
		end
		for i=1,#CageObjs do
			if GetEntityModel(object) == GetHashKey(CageObjs[i]) then
				ReqAndDelete(object, false)
			end
		end
		finished, object = FindNextObject(handle)
	until not finished
	EndFindObject(handle)
end
end)

Citizen.CreateThread(function()				-- Vehicle Flags
while true do
	Citizen.Wait(30000)
		local playerPed = GetPlayerPed(-1)
		Wait(1)
			if playerPed then
				modelfunc(GetVehiclePedIsIn(playerPed, false))
					for _, carModel in ipairs(BlacklistedVehicles) do
				modelfunc(GetClosestVehicle(x, y, z, 100.0, GetHashKey(carModel), 70))
			end
		end
end
end)

function modelfunc(car)						-- Get Vehicle Model Function
if car then
	carModel = GetEntityModel(car)
	carName = GetDisplayNameFromVehicleModel(carModel)

	if isCarBlacklisted(carModel) then
		TriggerServerEvent("MWGAC:VehicleFlag", carName, car)
	end
end
end

function isCarBlacklisted(model)			-- Checks if Car is Blacklisted Model
for _, carModel in pairs(BlacklistedVehicles) do
	if model == GetHashKey(carModel) then
		return true
	end
end
return false
end

RegisterNetEvent('MWGAC:Delete') 		-- Delete Client Event
AddEventHandler('MWGAC:Delete', function(car)
	SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(GetVehiclePedIsIn(GetPlayerPed(-1))))

end)

for i=1, #events, 1 do						-- Trigger Event Detection
AddEventHandler(events[i], function()
TriggerServerEvent('613cd851-bb4c-4825-8d4a-423caa7bf2c3', events[i])
end)
end
