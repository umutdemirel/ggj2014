local GameLevel1Screen = {}

local levelSelectBackgroundImage_Sprite
local gameLevelBarImage_Sprite
local levelSelectButtons = {}
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local numberOfLevels = 15
local buttonThreshold = 20

local backButton
local rostak
local option1Button
local option2Button
local option3Button

local function levelSelectTouchHandler (self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			print(event.target.levelToLoad)
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
	end
end

local function backButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
		sfxList["buttonClick_sfx"].play()
		menuOut( GameLevelSelectScreenMenuID, false )
	end
end

local function option1ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
		levelID = 1
		levelItem = 1
		sfxList["buttonClick_sfx"].play()
		menuOut( GamePlayScreenMenuID, false )
	end
end

local function option2ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
		levelID = 1
		levelItem = 2
		sfxList["buttonClick_sfx"].play()
		menuOut( GamePlayScreenMenuID, false )
	end
end

local function option3ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
		levelID = 1
		levelItem = 3
		sfxList["buttonClick_sfx"].play()
		menuOut( GamePlayScreenMenuID, false )
	end
end

local function loadScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.actualContentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true

	display.remove(levelSelectBackgroundImage_Sprite)
	levelSelectBackgroundImage_Sprite = nil
	levelSelectBackgroundImage_Sprite = display.newSprite(spriteSheetsMenu["gameLevelBackground"], spriteSetsMenu["gameLevelBackground"])
	levelSelectBackgroundImage_Sprite:setSequence("gameLevelBackground")
	levelSelectBackgroundImage_Sprite:play()
	levelSelectBackgroundImage_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	levelSelectBackgroundImage_Sprite.x = display.contentWidth * 0.5
	levelSelectBackgroundImage_Sprite.y = display.contentHeight
	levelSelectBackgroundImage_Sprite.xScale = 1
	levelSelectBackgroundImage_Sprite.yScale = 1
	levelSelectBackgroundImage_Sprite.alpha = 1
	levelSelectBackgroundImage_Sprite.rotation = 0
	screenHolder:insert(levelSelectBackgroundImage_Sprite)
	
	display.remove(gameLevelBarImage_Sprite)
	gameLevelBarImage_Sprite = nil
	gameLevelBarImage_Sprite = display.newImage("GGJ14_GameLevelBar.png")
	gameLevelBarImage_Sprite:setReferencePoint(display.CenterReferencePoint)
	gameLevelBarImage_Sprite.x = display.contentWidth * 0.5
	gameLevelBarImage_Sprite.y = display.contentHeight * 0.42
	gameLevelBarImage_Sprite.xScale = 1
	gameLevelBarImage_Sprite.yScale = 1
	gameLevelBarImage_Sprite.alpha = 1
	gameLevelBarImage_Sprite.rotation = 0
	screenHolder:insert(gameLevelBarImage_Sprite)

	display.remove(backButton)
	backButton = nil
	backButton = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	backButton:setSequence("backIdle")
	backButton:play()
	backButton:setReferencePoint(display.TopLeftReferencePoint)
	backButton.x = display.contentWidth - backButton.width + 20
	backButton.y = display.contentHeight - backButton.height + 20
	backButton.xScale = 1
	backButton.yScale = 1
	backButton.alpha = 1
	backButton.rotation = 0
	screenHolder:insert(backButton)
	
	display.remove(rostak)
	rostak = nil
	rostak = display.newImage("GGJ14_Level1_1.png")
	rostak:setReferencePoint(display.CenterReferencePoint)
	rostak.x = display.contentWidth * 0.5
	rostak.y = display.contentHeight * 0.2
	rostak.xScale = 0.8
	rostak.yScale = 0.8
	rostak.alpha = 1
	rostak.rotation = 0
	screenHolder:insert(rostak)
	
	display.remove(option1Button)
	option1Button = nil
	option1Button = display.newImage("GGJ14_Level1_2.png")
	option1Button:setReferencePoint(display.CenterReferencePoint)
	option1Button.x = display.contentWidth * 0.15
	option1Button.y = display.contentHeight * 0.68
	option1Button.xScale = 1
	option1Button.yScale = 1
	option1Button.alpha = 1
	option1Button.rotation = 0
	screenHolder:insert(option1Button)
	
	display.remove(option2Button)
	option2Button = nil
	option2Button = display.newImage("GGJ14_Level1_3.png")
	option2Button:setReferencePoint(display.CenterReferencePoint)
	option2Button.x = display.contentWidth * 0.5
	option2Button.y = display.contentHeight * 0.68
	option2Button.xScale = 1
	option2Button.yScale = 1
	option2Button.alpha = 1
	option2Button.rotation = 0
	screenHolder:insert(option2Button)
	
	display.remove(option3Button)
	option3Button = nil
	option3Button = display.newImage("GGJ14_Level1_4.png")
	option3Button:setReferencePoint(display.CenterReferencePoint)
	option3Button.x = display.contentWidth * 0.85
	option3Button.y = display.contentHeight * 0.68
	option3Button.xScale = 1
	option3Button.yScale = 1
	option3Button.alpha = 1
	option3Button.rotation = 0
	screenHolder:insert(option3Button)
	
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end


function GameLevel1Screen.addButtonEventListeners ()
	backButton.touch = backButtonTouchHandler
	backButton:addEventListener("touch", backButton)
	
	option1Button.touch = option1ButtonTouchHandler
	option1Button:addEventListener("touch", option1Button)
	
	option2Button.touch = option2ButtonTouchHandler
	option2Button:addEventListener("touch", option2Button)
	
	option3Button.touch = option3ButtonTouchHandler
	option3Button:addEventListener("touch", option3Button)
end

menuInCompleted = function (obj)
	GameLevel1Screen.addButtonEventListeners()
end

function GameLevel1Screen.playSound()
end

function GameLevel1Screen.menuIn ()
	GameLevel1Screen.playSound()

	loadScreen()

	screenHolder.alpha = 0
	transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 1, onComplete = menuInCompleted})
end

function GameLevel1Screen.removeButtonEventListeners ()
	backButton.touch = nil
	backButton:removeEventListener("touch", backButton)
	
	option1Button.touch = nil
	option1Button:removeEventListener("touch", option1Button)
	
	option2Button.touch = nil
	option2Button:removeEventListener("touch", option2Button)
	
	option3Button.touch = nil
	option3Button:removeEventListener("touch", option3Button)
end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GameLevel1ScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	GameLevel1Screen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 0, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return GameLevel1Screen