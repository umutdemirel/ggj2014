local GameOverScreen = {}

local gameOverImage_Sprite
local restartButton_Button
local exitButton_Button
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners
local scoreText

local function restartButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			event.target:setSequence("CCWpressed")
			event.target:play()
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		event.target:setSequence("CCWidle")
		event.target:play()
		buttonPressEnabled = true
		event.target.pressed = false
		menuOut( GamePlayScreenMenuID, false )
	end
end

local function exitButtonTouchHandler(self, event)
	if event.phase == "began" then
		if buttonPressEnabled then
			buttonPressEnabled = false
			event.target.pressed = true
			event.target:setSequence("backPressed")
			event.target:play()
			display.getCurrentStage():setFocus( event.target, event.id )
			event.target.focus = true
		end
	elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		event.target:setSequence("backIdle")
		event.target:play()
		buttonPressEnabled = true
		event.target.pressed = false
		menuOut( GameLevelSelectScreenMenuID, false )
	end
end

local function loadScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.contentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true
	
	display.remove(gameOverImage_Sprite)
	gameOverImage_Sprite = nil
	gameOverImage_Sprite = display.newSprite(spriteSheetsMenu["levelSelectBackground"], spriteSetsMenu["levelSelectBackground"])
	gameOverImage_Sprite:setSequence("levelSelectBackground")
	gameOverImage_Sprite:play()
	gameOverImage_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	gameOverImage_Sprite.x = display.contentWidth * 0.5
	gameOverImage_Sprite.y = display.contentHeight
	gameOverImage_Sprite.xScale = 1
	gameOverImage_Sprite.yScale = 1
	gameOverImage_Sprite.alpha = 1
	gameOverImage_Sprite.rotation = 0

	display.remove(exitButton_Button)
	exitButton_Button = nil
	exitButton_Button = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	exitButton_Button:setSequence("backIdle")
	exitButton_Button:play()
	exitButton_Button:setReferencePoint(display.CenterReferencePoint)
	exitButton_Button.x = display.contentWidth - exitButton_Button.width * 0.5
	exitButton_Button.y = display.contentHeight - exitButton_Button.height * 0.5
	exitButton_Button.xScale = 1
	exitButton_Button.yScale = 1
	exitButton_Button.alpha = 1
	exitButton_Button.rotation = 0
	
	display.remove(restartButton_Button)
	restartButton_Button = nil
	restartButton_Button = display.newSprite(spriteSheetsShared["rotationButtons"], spriteSetsShared["rotationButtons"])
	restartButton_Button:setSequence("CCWidle")
	restartButton_Button:play()
	restartButton_Button:setReferencePoint(display.CenterReferencePoint)
	restartButton_Button.x = exitButton_Button.x - exitButton_Button.width + 50
	restartButton_Button.y = exitButton_Button.y
	restartButton_Button.xScale = 1.3
	restartButton_Button.yScale = 1.3
	restartButton_Button.alpha = 1
	restartButton_Button.rotation = 0

	
	
	scoreText = display.newText("", 0, 20, "PidginDance", 150)
	scoreText:setTextColor(0,0,0)
	scoreText.text = "%"..math.floor(score)
	scoreText:setReferencePoint(display.CenterReferencePoint)
	scoreText.x = display.contentWidth * 0.3
	scoreText.y = display.contentHeight * 0.3

	screenHolder:insert(gameOverImage_Sprite)
	screenHolder:insert(exitButton_Button)
	screenHolder:insert(restartButton_Button)
	screenHolder:insert(scoreText)
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function GameOverScreen.addButtonEventListeners ()
	restartButton_Button.touch = restartButtonTouchHandler
	restartButton_Button:addEventListener("touch", restartButton_Button)

	exitButton_Button.touch = exitButtonTouchHandler
	exitButton_Button:addEventListener("touch", exitButton_Button)

end

menuInCompleted = function (obj)
	GameOverScreen.addButtonEventListeners()
end

function GameOverScreen.playSound()
end

function GameOverScreen.menuIn ()
	GameOverScreen.playSound()

	loadScreen()

	transition.to(screenHolder, {time = 10, onComplete = menuInCompleted})
end

function GameOverScreen.removeButtonEventListeners ()
	restartButton_Button.touch = nil
	restartButton_Button:removeEventListener("touch", restartButton_Button)

	exitButton_Button.touch = nil
	exitButton_Button:removeEventListener("touch", exitButton_Button)

end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GameOverScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	GameOverScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return GameOverScreen
