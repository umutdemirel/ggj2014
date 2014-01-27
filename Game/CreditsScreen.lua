local CreditsScreen = {}

local backButton
local background_Sprite
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local function backButtonTouchHandler(self, event)
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
		sfxList["buttonClick_sfx"].play()
		menuOut( GameMainScreenMenuID, false )
	end
end

local function loadScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.contentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true

	display.remove(background_Sprite)
	background_Sprite = nil
	background_Sprite = display.newSprite(spriteSheetsMenu["creditsBackground"], spriteSetsMenu["creditsBackground"])
	background_Sprite:setSequence("creditsBackground")
	background_Sprite:play()
	background_Sprite:setReferencePoint(display.CenterReferencePoint)
	background_Sprite.x = display.contentWidth * 0.5
	background_Sprite.y = display.contentHeight * 0.5
	background_Sprite.xScale = 1
	background_Sprite.yScale = 1
	background_Sprite.alpha = 1
	background_Sprite.rotation = 0
	screenHolder:insert(background_Sprite)

	display.remove(backButton)
	backButton = nil
	backButton = display.newSprite(spriteSheetsMenu["levelButtons"], spriteSetsMenu["levelButtons"])
	backButton:setSequence("backIdle")
	backButton:play()
	backButton:setReferencePoint(display.TopLeftReferencePoint)
	backButton.x = display.contentWidth - backButton.width
	backButton.y = display.contentHeight - backButton.height
	backButton.xScale = 1
	backButton.yScale = 1
	backButton.alpha = 1
	backButton.rotation = 0
	screenHolder:insert(backButton)

	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function CreditsScreen.addButtonEventListeners ()
	backButton.touch = backButtonTouchHandler
	backButton:addEventListener("touch", backButton)

end

menuInCompleted = function (obj)
	CreditsScreen.addButtonEventListeners()
end

function CreditsScreen.playSound()
end

function CreditsScreen.menuIn ()
	CreditsScreen.playSound()

	loadScreen()

	screenHolder.alpha = 0
	transition.to(screenHolder, {time = 500, alpha = 1, onComplete = menuInCompleted})
end

function CreditsScreen.removeButtonEventListeners ()
	backButton.touch = nil
	backButton:removeEventListener("touch", backButtonTouchHandler)
end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = CreditsScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	CreditsScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 500, alpha = 0, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return CreditsScreen
