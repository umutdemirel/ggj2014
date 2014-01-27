local GameLevelSelectScreen = {}

local levelSelectBackgroundImage_Sprite
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
local level1Button
local level2Button
local level3Button


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
		menuOut( GameMainScreenMenuID, false )
	end
end

local function level1ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			event.target:setSequence("1pressed")
			event.target:play()
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
		event.target:setSequence("1idle")
		event.target:play()
		sfxList["buttonClick_sfx"].play()
		menuOut( GameLevel1MenuID, false )
	end
end

local function level2ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			event.target:setSequence("2pressed")
			event.target:play()
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
		event.target:setSequence("2idle")
		event.target:play()
		sfxList["buttonClick_sfx"].play()
		menuOut( GameLevel2MenuID, false )
	end
end

local function level3ButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			event.target:setSequence("3pressed")
			event.target:play()
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
		event.target:setSequence("3idle")
		event.target:play()
		sfxList["buttonClick_sfx"].play()
		menuOut( GameLevel3MenuID, false )
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
	levelSelectBackgroundImage_Sprite = display.newSprite(spriteSheetsMenu["levelSelectBackground"], spriteSetsMenu["levelSelectBackground"])
	levelSelectBackgroundImage_Sprite:setSequence("levelSelectBackground")
	levelSelectBackgroundImage_Sprite:play()
	levelSelectBackgroundImage_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	levelSelectBackgroundImage_Sprite.x = display.contentWidth * 0.5
	levelSelectBackgroundImage_Sprite.y = display.contentHeight
	levelSelectBackgroundImage_Sprite.xScale = 1
	levelSelectBackgroundImage_Sprite.yScale = 1
	levelSelectBackgroundImage_Sprite.alpha = 1
	levelSelectBackgroundImage_Sprite.rotation = 0
	screenHolder:insert(levelSelectBackgroundImage_Sprite)

	display.remove(backButton)
	backButton = nil
	backButton = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	backButton:setSequence("backIdle")
	backButton:play()
	backButton:setReferencePoint(display.TopLeftReferencePoint)
	backButton.x = display.contentWidth - backButton.width + 10
	backButton.y = display.contentHeight - backButton.height + 10
	backButton.xScale = 1
	backButton.yScale = 1
	backButton.alpha = 1
	backButton.rotation = 0
	screenHolder:insert(backButton)
	
	display.remove(level1Button)
	level1Button = nil
	level1Button = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	level1Button:setSequence("1idle")
	level1Button:play()
	level1Button:setReferencePoint(display.TopLeftReferencePoint)
	level1Button.x = display.contentWidth * 0.2
	level1Button.y = display.contentHeight * 0.1
	level1Button.xScale = 1
	level1Button.yScale = 1
	level1Button.alpha = 1
	level1Button.rotation = 0
	screenHolder:insert(level1Button)
	
	display.remove(level2Button)
	level2Button = nil
	level2Button = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	level2Button:setSequence("2idle")
	level2Button:play()
	level2Button:setReferencePoint(display.TopLeftReferencePoint)
	level2Button.x = display.contentWidth * 0.2
	level2Button.y = display.contentHeight * 0.3
	level2Button.xScale = 1
	level2Button.yScale = 1
	level2Button.alpha = 1
	level2Button.rotation = 0
	screenHolder:insert(level2Button)
	
	display.remove(level3Button)
	level3Button = nil
	level3Button = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	level3Button:setSequence("3idle")
	level3Button:play()
	level3Button:setReferencePoint(display.TopLeftReferencePoint)
	level3Button.x = display.contentWidth * 0.2
	level3Button.y = display.contentHeight * 0.5
	level3Button.xScale = 1
	level3Button.yScale = 1
	level3Button.alpha = 1
	level3Button.rotation = 0
	screenHolder:insert(level3Button)
	
	--[[
	for index=1, numberOfLevels, 1 do
		display.remove(levelSelectButtons[index])
		levelSelectButtons[index] = nil
		levelSelectButtons[index] = display.newSprite(spriteSheetsShared["menuButtons100x100"], spriteSetsShared["menuButtons100x100"])
		levelSelectButtons[index]:setSequence("infoIdle")
		levelSelectButtons[index]:play()
		levelSelectButtons[index]:setReferencePoint(display.TopLeftReferencePoint)
		levelSelectButtons[index].x = ((index - 1) % 3) * (levelSelectButtons[index].width + buttonThreshold)
		levelSelectButtons[index].y = math.floor( (index - 1) / 3 ) * (levelSelectButtons[index].width + buttonThreshold)
		levelSelectButtons[index].xScale = 1
		levelSelectButtons[index].yScale = 1
		levelSelectButtons[index].alpha = 1
		levelSelectButtons[index].rotation = 0
		levelSelectButtons[index].levelToLoad = index
		screenHolder:insert(levelSelectButtons[index])
	end
	]]
	
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end


function GameLevelSelectScreen.addButtonEventListeners ()
	backButton.touch = backButtonTouchHandler
	backButton:addEventListener("touch", backButton)
	
	level1Button.touch = level1ButtonTouchHandler
	level1Button:addEventListener("touch", level1Button)
	
	level2Button.touch = level2ButtonTouchHandler
	level2Button:addEventListener("touch", level2Button)
	
	level3Button.touch = level3ButtonTouchHandler
	level3Button:addEventListener("touch", level3Button)
	--[[
	for index=1, numberOfLevels, 1 do
		levelSelectButtons[index].touch = levelSelectTouchHandler
		levelSelectButtons[index]:addEventListener("touch", levelSelectButtons[index])
	end
	]]
end

menuInCompleted = function (obj)
	GameLevelSelectScreen.addButtonEventListeners()
end

function GameLevelSelectScreen.playSound()
end

function GameLevelSelectScreen.menuIn ()
	GameLevelSelectScreen.playSound()

	loadScreen()

	screenHolder.alpha = 0
	transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 1, onComplete = menuInCompleted})
end

function GameLevelSelectScreen.removeButtonEventListeners ()
	backButton.touch = nil
	backButton:removeEventListener("touch", backButton)
end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GameLevelSelectScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	GameLevelSelectScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 0, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return GameLevelSelectScreen