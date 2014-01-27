spriteSheetsShared = {}

function loadAnimationsShared()
	local loadingSheetData = { width=768, height=1136, numFrames=1 }
	local loadingSheet = graphics.newImageSheet("GGJ14_LoadingScreen.png", loadingSheetData)
	spriteSheetsShared["loading"] = loadingSheet
	local loadingSet = {
		{ name="loading", sheet=loadingSheet, start=1, count=1, time=10, loopCount=1 },
		}
	spriteSetsShared["loading"] = loadingSet

	local rotationButtonsSheetData = { width=108, height=100, numFrames=4 }
	local rotationButtonsSheet = graphics.newImageSheet("GGJ14_RotationButtons.png", rotationButtonsSheetData)
	spriteSheetsShared["rotationButtons"] = rotationButtonsSheet
	local rotationButtonsSet = {
		{ name="CWidle", sheet=rotationButtonsSheet, start=1, count=1, time=500, loopCount=1 },
		{ name="CWpressed", sheet=rotationButtonsSheet, start=2, count=1, time=500, loopCount=1 },
		{ name="CCWidle", sheet=rotationButtonsSheet, start=3, count=1, time=500, loopCount=1 },
		{ name="CCWpressed", sheet=rotationButtonsSheet, start=4, count=1, time=500, loopCount=1 },
		}
	spriteSetsShared["rotationButtons"] = rotationButtonsSet
end
local function releaseSheet(releaseIndex)
	spriteSheetsShared[releaseIndex]:dispose()
	spriteSheetsShared[releaseIndex] = nil
end

local function releaseSets()
	spriteSheetsShared = nil
	spriteSheetsShared = {}
	spriteSetsShared = nil
	spriteSetsShared = {}
end

function releaseAnimationsShared()
	for i=1, #spriteSheetsShared, 1 do
		timer.performWithDelay(0, function() return releaseSheet( i ) end, 1)
	end
	timer.performWithDelay(0, releaseSets, 1)
end