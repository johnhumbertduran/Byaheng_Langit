-- require util module for saving and loading data
local util = require( "lib.util" )

-- settings module
local settings = {}

-- cold start --
-- load and reference data from a JSON file named "gameSettings"
local data = util.load("settings.json")

-- if file doesn't exist
if (not data) then

	-- create data
	settings.currentLevel = 1
	settings.levels ={   
						1, 2, 2, 
						2, 2, 2, 
						2,
					}
	settings.levelScore = {
							0, 0, 0,
							0, 0, 0,
							0
					      }

	-- save data
	util.save(settings, "settings.json")
else

	-- if already exist
	-- load data
	settings = data

end

return settings-- require util module for saving and loading data
