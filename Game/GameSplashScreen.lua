local GameSplashScreen = {}

local deneme1_Animation
local splashImage_Sprite
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local function loadScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.contentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true
	
	display.remove(splashImage_Sprite)
	splashImage_Sprite = nil
	splashImage_Sprite = display.newSprite(spriteSheetsMenu["splash"], spriteSetsMenu["splash"])
	splashImage_Sprite:setSequence("splash")
	splashImage_Sprite:play()
	splashImage_Sprite:setReferencePoint(display.CenterReferencePoint)
	splashImage_Sprite.x = display.contentWidth * 0.5
	splashImage_Sprite.y = display.contentHeight * 0.5
	splashImage_Sprite.xScale = 1
	splashImage_Sprite.yScale = 1
	splashImage_Sprite.alpha = 1
	splashImage_Sprite.rotation = 0
	
	display.remove(comics_Sprite)
	comics_Sprite = nil
	comics_Sprite = display.newSprite(spriteSheetsMenu["comics"], spriteSetsMenu["comics"])
	comics_Sprite:setSequence("comics")
	comics_Sprite:play()
	comics_Sprite:setReferencePoint(display.CenterReferencePoint)
	comics_Sprite.x = display.contentWidth * 0.5
	comics_Sprite.y = display.contentHeight * 0.5
	comics_Sprite.xScale = 1
	comics_Sprite.yScale = 1
	comics_Sprite.alpha = 0
	comics_Sprite.rotation = 0
	transition.to(comics_Sprite, {delay = 2500, time = 800, transition = easing.logaritmic, alpha = 1})
	transition.to(splashImage_Sprite, {delay = 2500, time = 800, transition = easing.logaritmic, alpha = 0})

	screenHolder:insert(splashImage_Sprite)
	screenHolder:insert(comics_Sprite)
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function GameSplashScreen.addButtonEventListeners ()
end

function GameSplashScreen.playSound()
	
end

menuInCompleted = function (obj)
	GameSplashScreen.addButtonEventListeners()
end

function GameSplashScreen.menuIn ()
	GameSplashScreen.playSound()

	loadScreen()

	screenHolder.alpha = 0
	transition.to(screenHolder, {time = 800, transition = easing.logaritmic, alpha = 1, onComplete = menuInCompleted})

	timer.performWithDelay(1000, function () sfxList["highFive_sfx"].play() end)
	timer.performWithDelay(10000, function () menuOut ( GameMainScreenMenuID ) end)
end

function GameSplashScreen.removeButtonEventListeners ()
end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GameSplashScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	GameSplashScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 0, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return GameSplashScreen
