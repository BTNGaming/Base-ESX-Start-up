Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 15  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 1 -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

Config.EnableJobLogs 			  = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = {coords = vector3(285.95, -1351.1, 24.53), heading = 319.58}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-453.51, -339.77, 34.36),
			sprite = 61,
			scale  = 1.0,
			color  = 2
		},

		AmbulanceActions = {
			vector3(-437.51, -308.82, 33.91)
		},

		Pharmacies = {
			vector3(-492.07, -340.69, 41.32)
		},

		Vehicles = {
			{
				Spawner = vector3(-421.63, -349.7, 24.23),
				InsideShop = vector3(-438.93, -351.64, 24.23),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 0, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-444.22, -338.97, 24.23), heading = 197.44, radius = 10.0 },
					{ coords = vector3(-434.37, -365.55, 24.23), heading = 20.03, radius = 10.0 },
					{ coords = vector3(-435.5, -350.95, 24.23), heading = 201.9, radius = 10.0 },
					{ coords = vector3(-439.56, -352.53, 24.23), heading = 198.71, radius = 10.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-460.38, -343.04, 91.01),
				InsideShop = vector3(-473.02, -336.82, 91.01),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 255, g = 0, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-473.02, -336.82, 91.01), heading = 258.81, radius = 20.0 },
					
				}
			}
		},

		FastTravels = {
			{	--Hospital to Rooftop
				From = vector3(-487.39, -328.05, 41.31),
				To = { coords = vector3(-486.81, -339.38, 91.01), heading = 303.01 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{	--Rooftop to Hospital
				From = vector3(-487.39, -334.79, 90.01),
				To = { coords = vector3(-490.37, -327.18, 41.31), heading = 173.77},
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{	--Hospital to Morgue
				From = vector3(-452.27, -288.42, 33.95),
				To = { coords = vector3(296.27, -1352.02, 23.54), heading = 50.18 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{	--Morgue to Hospital
				From = vector3(282.24, -1346.43, 23.54),
				To = { coords = vector3(-454.99, -289.6, 34.91), heading = 189.19 },
				Marker = { type = 25, x = 4.0, y = 4.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{   --Hospital to Parking
				From = vector3(-436.03, -359.97, 33.95),
				To = { coords = vector3(-422.49, -345.78, 24.23), heading = 281.83 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{   --Parking to Hospital
				From = vector3(-418.5, -344.48, 23.23),
				To = { coords = vector3(-435.91, -356.76, 33.91), heading = 179.67 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},
			
			{   --First Floor to Second Floor
				From = vector3(-493.57, -327.07, 41.31),
				To = { coords = vector3(-487.9, -328.13, 69.5), heading = 177.83 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{   --Second Floor to First Floor
				From = vector3(-490.57, -327.48, 68.51),
				To = { coords = vector3(-493.83, -329.86, 42.32), heading = 229.13 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},

			{   --3rd Floor to Emegency Floor
				From = vector3(-493.56, -327.14, 68.5),
				To = { coords = vector3(-455.12, -289.86, 34.91), heading = 167.04 },
				Marker = { type = 25, x = 2.0, y = 2.0, z = 0.5, r = 255, g = 0, b = 0, a = 100, rotate = false }
			},
			
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		trainee = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
		nurse = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
	
		hdnurse = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
	
		doctor = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
	
		head_doctor = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
		assdirec = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		},
	
		boss = {
			{ model = 'ambulance', label = 'Ambulance Van', price = 5000},
			{ model = 'dodgeems', label = 'Dodge Charger', price = 5000},
			{ model = 'gnr_i8', label = 'EMS I8', price = 5000},
			{ model = 'ems-bike', label = 'EMS Bike', price = 5000},
			{ model = 'ems-camaro', label = 'EMS Camaro', price = 5000},
			{ model = 'ems-djeep', label = 'EMS Jeep', price = 5000},
			{ model = 'ems-jp12', label = 'EMS Wrangler', price = 5000},
			{ model = 'ems-medic51', label = 'EMS Car', price = 5000},
			{ model = 'ems-medic52', label = 'EMS Car', price = 5000},
		}
	},

	helicopter = {
		trainee = {},

		nurse = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
		},
		doctor = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
		},
		hdnurse = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
		},
	
		head_doctor = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
		},
		assdirec = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
		},
	
		boss = {
			{ model = 'ems-air5', label = 'EMS Helicopter', livery = 0, price = 1500}
			
		}
	}
}

