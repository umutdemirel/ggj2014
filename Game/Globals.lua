spriteSetsGame = {}
spriteSetsMenu = {}
spriteSetsShared = {}

NextScreenId = ""
PreviousScreenId = ""

platform2MenuID = "platform2"
foreground2MenuID = "foreground2"
GameOverScreenMenuID = "GameOverScreen"
platform4MenuID = "platform4"
foreground1MenuID = "foreground1"
GameLoadingScreenMenuID = "GameLoadingScreen"
GamePlayScreenMenuID = "GamePlayScreen"
GameSplashScreenMenuID = "GameSplashScreen"
background2MenuID = "background2"
background3MenuID = "background3"
GameMainScreenMenuID = "GameMainScreen"
GameLevel1MenuID = "GameLevel1"
GameLevel2MenuID = "GameLevel2"
GameLevel3MenuID = "GameLevel3"
GameLevelSelectScreenMenuID = "GameLevelSelectScreen"
background1MenuID = "background1"
platform3MenuID = "platform3"
CreditsScreenMenuID = "CreditsScreen"
extraScreenMenuID = "extraScreen"
platform1MenuID = "platform1"
foreground3MenuID = "foreground3"
NewPopUpMenuID = "NewPopUp"

levelID = 1
levelItem = 1
score = 0
currentTime = 0

var_gameScore = 100
displayWidth = display.contentWidth
var_deneme = true
var_facebookMessagePart1 = "I scored "
var_deneme2 = "hello world"
displayHeight = display.contentHeight
displayHalfHeight = display.contentHeight / 2
var_facebookMessagePart2 = "! Can you beat me?"
displayHalfWidth = display.contentWidth / 2
var_parallaxSpeed = 20
facebookAppID = "201933103297007"

function getFontName(fontName)
	local allFonts = native.getFontNames()
	local index
	for index=1, #allFonts, 1 do
		if fontName == allFonts[index] then
			return fontName
		end
	end
	return native.systemFont
end

function testNetworkConnection()
	local google = require('socket').connect('google.com', 80)
	if google == nil then
		return false
	end
	google:close()
	return true
end
