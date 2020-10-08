

local M = {}
M.maxLevels = 40
M.settings = {}
M.settings.currentLevel = 1
M.settings.unlockedLevels = 3
M.settings.soundOn = true
M.settings.musicOn = true
M.settings.levels = {} 
M.settings.levels[1] = {}
M.settings.levels[1].stars = 3
M.settings.levels[1].score = 3833
M.settings.levels[2] = {}
M.settings.levels[2].stars = 2
M.settings.levels[2].score = 4394
M.settings.levels[3] = {}
M.settings.levels[3].stars = 1
M.settings.levels[3].score = 8384
M.settings.levels[4] = {}
M.settings.levels[4].stars = 0
M.settings.levels[4].score = 10294
--split
M.activeScenes = {}
for i=1,M.settings.unlockedLevels,1 do M.activeScenes[i] = false end



local loadsave = require("loadsave")
--loadsave.saveTable( M, "myDataSettings.json" ) -- if the User ever makes any changes / wins anything / etc.. then call this to write changes
--split
--local loadMyData = loadsave.loadTable("myDataSettings.json")
--M = loadMyData
--M.maxLevels = loadMyData.maxLevels
--M.settings = loadMyData.settings
--M.activeScenes = loadMyData.activeScenes



-- levels data members:
--      .stars -- Stars earned per level
--      .score -- Score for the level

--local loadsave = require("loadsave")
------loadsave.saveTable( myData, "settings.json" )
--local loadedSettings = loadsave.loadTable( "settings.json" )
--M = loadedSettings.M

return M