spriteSheetsMenu = {}

function loadAnimationsMenu()
	local splashSheetData = { width=768, height=1136, numFrames=1 }
	local splashSheet = graphics.newImageSheet("GGJ14_SplashScreen.png", splashSheetData)
	spriteSheetsMenu["splash"] = splashSheet
	local splashSet = {
		{ name="splash", sheet=splashSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["splash"] = splashSet
	
	local mainBackgroundSheetData = { width=768, height=1600, numFrames=2 }
	local mainBackgroundSheet = graphics.newImageSheet("GGJ14_MainScreenBackground.png", mainBackgroundSheetData)
	spriteSheetsMenu["mainBackground"] = mainBackgroundSheet
	local mainBackgroundSet = {
		{ name="mainBackground1", sheet=mainBackgroundSheet, start=1, count=1, time=10, loopCount=1 },
		{ name="mainBackground2", sheet=mainBackgroundSheet, start=2, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["mainBackground"] = mainBackgroundSet
	
	local levelButtonsSheetData = { width=177, height=172, numFrames=8 }
	local levelButtonsSheet = graphics.newImageSheet("GGJ14_LevelButtons.png", levelButtonsSheetData)
	spriteSheetsMenu["levelButtons"] = levelButtonsSheet
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
	spriteSetsMenu["levelButtons"] = levelButtonsSet
	
	local levelSelectBackgroundSheetData = { width=768, height=1136, numFrames=1 }
	local levelSelectBackgroundSheet = graphics.newImageSheet("GGJ14_LevelSelectBackground.png", levelSelectBackgroundSheetData)
	spriteSheetsMenu["levelSelectBackground"] = levelSelectBackgroundSheet
	local levelSelectBackgroundSet = {
		{ name="levelSelectBackground", sheet=levelSelectBackgroundSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["levelSelectBackground"] = levelSelectBackgroundSet
	
	local gameLevelBackgroundSheetData = { width=768, height=1136, numFrames=1 }
	local gameLevelBackgroundSheet = graphics.newImageSheet("GGJ14_GameLevelBackground.png", gameLevelBackgroundSheetData)
	spriteSheetsMenu["gameLevelBackground"] = gameLevelBackgroundSheet
	local gameLevelBackgroundSet = {
		{ name="gameLevelBackground", sheet=gameLevelBackgroundSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["gameLevelBackground"] = gameLevelBackgroundSet
	
	local creditsBackgroundSheetData = { width=768, height=1136, numFrames=1 }
	local creditsBackgroundSheet = graphics.newImageSheet("GGJ14_CreditsBackground.png", creditsBackgroundSheetData)
	spriteSheetsMenu["creditsBackground"] = creditsBackgroundSheet
	local creditsBackgroundSet = {
		{ name="creditsBackground", sheet=creditsBackgroundSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["creditsBackground"] = creditsBackgroundSet
	
	local comicsSheetData = { width=768, height=1136, numFrames=1 }
	local comicsSheet = graphics.newImageSheet("GGJ14_Comics.png", comicsSheetData)
	spriteSheetsMenu["comics"] = comicsSheet
	local comicsSet = {
		{ name="comics", sheet=comicsSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsMenu["comics"] = comicsSet
end

local function releaseSheet(releaseIndex)
	spriteSheetsMenu[releaseIndex]:dispose()
	spriteSheetsMenu[releaseIndex] = nil
end

local function releaseSets()
	spriteSheetsMenu = nil
	spriteSheetsMenu = {}
	spriteSetsMenu = nil
	spriteSetsMenu = {}
end

function releaseAnimationsMenu()
	for i=1, #spriteSheetsMenu, 1 do
		timer.performWithDelay(0, function() return releaseSheet( i ) end, 1)
	end
	timer.performWithDelay(0, releaseSets, 1)
end
