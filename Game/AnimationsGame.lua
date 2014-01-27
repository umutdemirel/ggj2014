spriteSheetsGame = {}

function loadAnimationsGame()
	local yankarakter1150x150SheetData = { width=150, height=150, numFrames=12 }
	local yankarakter1150x150Sheet = graphics.newImageSheet("yankarakter1.png", yankarakter1150x150SheetData)
	spriteSheetsGame["yankarakter1150x150"] = yankarakter1150x150Sheet
	local yankarakter1150x150Set = {
		{ name="char1run", sheet=yankarakter1150x150Sheet, start=1, count=12, time=500, loopCount=0 },
		}
	spriteSetsGame["yankarakter1150x150"] = yankarakter1150x150Set
	
	--local randomShapesSheetData = { width=70, height=70, numFrames=4 }
	local randomShapesSheetData = { width=60, height=75, numFrames=4 }
	local randomShapesSheet = graphics.newImageSheet("randomShapes.png", randomShapesSheetData)
	spriteSheetsGame["randomShapes"] = randomShapesSheet
	local randomShapesSet = {
		{ name="1", sheet=randomShapesSheet, start=1, count=1, time=500, loopCount=1 },
		{ name="2", sheet=randomShapesSheet, start=2, count=1, time=500, loopCount=1 },
		{ name="3", sheet=randomShapesSheet, start=3, count=1, time=500, loopCount=1 },
		{ name="4", sheet=randomShapesSheet, start=4, count=1, time=500, loopCount=1 },
		}
	spriteSetsGame["randomShapes"] = randomShapesSet
	
	local gameBackgroundSheetData = { width=768, height=1136, numFrames=1 }
	local gameBackgroundSheet = graphics.newImageSheet("GGJ14_GameBackground.png", gameBackgroundSheetData)
	spriteSheetsGame["gameBackground"] = gameBackgroundSheet
	local gameBackgroundSet = {
		{ name="gameBackground", sheet=gameBackgroundSheet, start=1, count=1, time=500, loopCount=1 },
		}
	spriteSetsGame["gameBackground"] = gameBackgroundSet
	
	--local glueSheetData = { width=360, height=247, numFrames=2 }
	--local glueSheet = graphics.newImageSheet("GGJ14_Glue.png", glueSheetData)
	local glueSheetData = { width=360, height=196, numFrames=2 }
	local glueSheet = graphics.newImageSheet("GGJ14_Glue2.png", glueSheetData)
	spriteSheetsGame["glue"] = glueSheet
	local glueSet = {
		{ name="glueIdle", sheet=glueSheet, start=1, count=1, time=500, loopCount=1 },
		{ name="gluePressed", sheet=glueSheet, start=2, count=1, time=500, loopCount=1 },
		}
	spriteSetsGame["glue"] = glueSet
	
	local siluetSheetData = { width=640, height=640, numFrames=9 }
	local siluetSheet = graphics.newImageSheet("GGJ14_Siluet.png", siluetSheetData)
	spriteSheetsGame["siluet"] = siluetSheet
	local siluetSet = {
		{ name="1_1", sheet=siluetSheet, start=1, count=1, time=500, loopCount=1 },
		{ name="1_2", sheet=siluetSheet, start=2, count=1, time=500, loopCount=1 },
		{ name="1_3", sheet=siluetSheet, start=3, count=1, time=500, loopCount=1 },
		{ name="2_1", sheet=siluetSheet, start=4, count=1, time=500, loopCount=1 },
		{ name="2_2", sheet=siluetSheet, start=5, count=1, time=500, loopCount=1 },
		{ name="2_3", sheet=siluetSheet, start=6, count=1, time=500, loopCount=1 },
		{ name="3_1", sheet=siluetSheet, start=7, count=1, time=500, loopCount=1 },
		{ name="3_2", sheet=siluetSheet, start=8, count=1, time=500, loopCount=1 },
		{ name="3_3", sheet=siluetSheet, start=9, count=1, time=500, loopCount=1 },
		}
	spriteSetsGame["siluet"] = siluetSet
	
	local levelButtonsSheetData = { width=177, height=172, numFrames=8 }
	local levelButtonsSheet = graphics.newImageSheet("GGJ14_LevelButtons.png", levelButtonsSheetData)
	spriteSheetsGame["levelButtons"] = levelButtonsSheet
	local levelButtonsSet = {
		{ name="1idle", sheet=levelButtonsSheet, start=1, count=1, time=10, loopCount=1 },
		{ name="1pressed", sheet=levelButtonsSheet, start=5, count=1, time=10, loopCount=1 },
		{ name="2idle", sheet=levelButtonsSheet, start=2, count=1, time=10, loopCount=1 },
		{ name="2pressed", sheet=levelButtonsSheet, start=6, count=1, time=10, loopCount=1 },
		{ name="3idle", sheet=levelButtonsSheet, start=3, count=1, time=10, loopCount=1 },
		{ name="3pressed", sheet=levelButtonsSheet, start=7, count=1, time=10, loopCount=1 },
		{ name="backIdle", sheet=levelButtonsSheet, start=4, count=1, time=10, loopCount=1 },
		{ name="backPressed", sheet=levelButtonsSheet, start=8, count=1, time=10, loopCount=1 },
		}
	spriteSetsGame["levelButtons"] = levelButtonsSet
end

local function releaseSheet(releaseIndex)
	spriteSheetsGame[releaseIndex]:dispose()
	spriteSheetsGame[releaseIndex] = nil
end

local function releaseSets()
	spriteSheetsGame = nil
	spriteSheetsGame = {}
	spriteSetsGame = nil
	spriteSetsGame = {}
end

function releaseAnimationsGame()
	for i=1, #spriteSheetsGame, 1 do
		timer.performWithDelay(0, function() return releaseSheet( i ) end, 1)
	end
	timer.performWithDelay(0, releaseSets, 1)
end
