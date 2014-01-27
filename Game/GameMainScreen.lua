local GameMainScreen = {}

local mainMenuBackgroundImage_Sprite
local creditsButton_Button
local newPopUpButton_Button
local playButton_Button
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local buttonThreshold = 20

local baloncuk1_Sprite
local baloncuk2_Sprite
local baloncuk3_Sprite
local baloncuk4_Sprite

local function creditsButtonTouchHandler(self, event)
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
		menuOut( CreditsScreenMenuID, false )
	end
end

local function playButtonTouchHandler(self, event)
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
		--menuOut( GamePlayScreenMenuID, false )
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
	
	display.remove(mainMenuBackgroundImage_Sprite)
	mainMenuBackgroundImage_Sprite = nil
	mainMenuBackgroundImage_Sprite = display.newSprite(spriteSheetsMenu["mainBackground"], spriteSetsMenu["mainBackground"])
	mainMenuBackgroundImage_Sprite:setSequence("mainBackground1")
	mainMenuBackgroundImage_Sprite:play()
	mainMenuBackgroundImage_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	mainMenuBackgroundImage_Sprite.x = display.contentWidth * 0.5
	mainMenuBackgroundImage_Sprite.y = display.contentHeight
	mainMenuBackgroundImage_Sprite.xScale = 1
	mainMenuBackgroundImage_Sprite.yScale = 1
	mainMenuBackgroundImage_Sprite.alpha = 1
	mainMenuBackgroundImage_Sprite.rotation = 0
	
	timer.performWithDelay(2000, function ()
		mainMenuBackgroundImage_Sprite:setSequence("mainBackground2")
		mainMenuBackgroundImage_Sprite:play()
		end)
		
	transition.to(mainMenuBackgroundImage_Sprite, {time = 1500, delay=2500, y = mainMenuBackgroundImage_Sprite.height - 70})

	
	display.remove(baloncuk1_Sprite)
	baloncuk1_Sprite = nil
	baloncuk1_Sprite = display.newImage("GGJ14_Baloncuk1.png")
	baloncuk1_Sprite:setReferencePoint(display.TopCenterReferencePoint)
	baloncuk1_Sprite.x = display.contentWidth * 0.5 + 50
	baloncuk1_Sprite.y = 750
	baloncuk1_Sprite.xScale = 1
	baloncuk1_Sprite.yScale = 1
	baloncuk1_Sprite.alpha = 0
	baloncuk1_Sprite.rotation = 0
	
	display.remove(baloncuk2_Sprite)
	baloncuk2_Sprite = nil
	baloncuk2_Sprite = display.newImage("GGJ14_Baloncuk2.png")
	baloncuk2_Sprite:setReferencePoint(display.TopCenterReferencePoint)
	baloncuk2_Sprite.x = display.contentWidth * 0.5 + 110
	baloncuk2_Sprite.y = 700
	baloncuk2_Sprite.xScale = 1
	baloncuk2_Sprite.yScale = 1
	baloncuk2_Sprite.alpha = 0
	baloncuk2_Sprite.rotation = 0
	
	display.remove(baloncuk3_Sprite)
	baloncuk3_Sprite = nil
	baloncuk3_Sprite = display.newImage("GGJ14_Baloncuk3.png")
	baloncuk3_Sprite:setReferencePoint(display.TopCenterReferencePoint)
	baloncuk3_Sprite.x = display.contentWidth * 0.5 + 140
	baloncuk3_Sprite.y = 600
	baloncuk3_Sprite.xScale = 1
	baloncuk3_Sprite.yScale = 1
	baloncuk3_Sprite.alpha = 0
	baloncuk3_Sprite.rotation = 0
	
	display.remove(baloncuk4_Sprite)
	baloncuk4_Sprite = nil
	baloncuk4_Sprite = display.newImage("GGJ14_Baloncuk4.png")
	baloncuk4_Sprite:setReferencePoint(display.TopCenterReferencePoint)
	baloncuk4_Sprite.x = display.contentWidth * 0.5
	baloncuk4_Sprite.y = 300
	baloncuk4_Sprite.xScale = 1
	baloncuk4_Sprite.yScale = 1
	baloncuk4_Sprite.alpha = 0
	baloncuk4_Sprite.rotation = 0
	
	display.remove(heykel1_Sprite)
	heykel1_Sprite = nil
	heykel1_Sprite = display.newImage("GGJ14_Heykel1.png")
	heykel1_Sprite:setReferencePoint(display.CenterReferencePoint)
	heykel1_Sprite.x = baloncuk4_Sprite.x 
	heykel1_Sprite.y = baloncuk4_Sprite.y + baloncuk4_Sprite.height * 0.5
	heykel1_Sprite.xScale = 1
	heykel1_Sprite.yScale = 1
	heykel1_Sprite.alpha = 0
	heykel1_Sprite.rotation = 0
	
	display.remove(heykel2_Sprite)
	heykel2_Sprite = nil
	heykel2_Sprite = display.newImage("GGJ14_Heykel2.png")
	heykel2_Sprite:setReferencePoint(display.CenterReferencePoint)
	heykel2_Sprite.x = baloncuk4_Sprite.x 
	heykel2_Sprite.y = baloncuk4_Sprite.y + baloncuk4_Sprite.height * 0.5
	heykel2_Sprite.xScale = 1
	heykel2_Sprite.yScale = 1
	heykel2_Sprite.alpha = 0
	heykel2_Sprite.rotation = 0
	
	display.remove(playButton_Button)
	playButton_Button = nil
	playButton_Button = display.newImage("GGJ14_PlayButton.png")
	playButton_Button:setReferencePoint(display.CenterReferencePoint)
	playButton_Button.x = baloncuk4_Sprite.x
	playButton_Button.y = baloncuk4_Sprite.y + baloncuk4_Sprite.height * 0.5
	playButton_Button.xScale = 1
	playButton_Button.yScale = 1
	playButton_Button.alpha = 0
	playButton_Button.rotation = 0
	
	display.remove(creditsButton_Button)
	creditsButton_Button = nil
	creditsButton_Button = display.newImage("GGJ14_CreditsButton.png")
	creditsButton_Button:setReferencePoint(display.CenterReferencePoint)
	creditsButton_Button.x = baloncuk3_Sprite.x
	creditsButton_Button.y = baloncuk3_Sprite.y + baloncuk3_Sprite.height * 0.5
	creditsButton_Button.xScale = 1
	creditsButton_Button.yScale = 1
	creditsButton_Button.alpha = 0
	creditsButton_Button.rotation = 0
	
	transition.to(baloncuk1_Sprite, {time = 250, delay=4000, alpha = 1})
	transition.to(baloncuk2_Sprite, {time = 250, delay=4250, alpha = 1})
	transition.to(baloncuk3_Sprite, {time = 250, delay=4500, alpha = 1})
	transition.to(baloncuk4_Sprite, {time = 250, delay=4750, alpha = 1})
	transition.to(heykel1_Sprite, {time = 500, delay=5000, alpha = 1})
	transition.to(heykel1_Sprite, {time = 500, delay=5500, alpha = 0})
	transition.to(heykel1_Sprite, {time = 500, delay=6000, alpha = 1})
	transition.to(heykel1_Sprite, {time = 500, delay=6500, alpha = 0})
	transition.to(heykel2_Sprite, {time = 500, delay=5500, alpha = 1})
	transition.to(heykel2_Sprite, {time = 500, delay=6000, alpha = 0})
	transition.to(heykel2_Sprite, {time = 500, delay=6500, alpha = 1})
	transition.to(heykel2_Sprite, {time = 500, delay=7000, alpha = 0})
	transition.to(playButton_Button, {time = 500, delay=7500, alpha = 1})
	transition.to(creditsButton_Button, {time = 500, delay=7500, alpha = 1})
	
	timer.performWithDelay(8000, menuInCompleted)

	screenHolder:insert(mainMenuBackgroundImage_Sprite)
	screenHolder:insert(baloncuk1_Sprite)
	screenHolder:insert(baloncuk2_Sprite)
	screenHolder:insert(baloncuk3_Sprite)
	screenHolder:insert(baloncuk4_Sprite)
	screenHolder:insert(heykel1_Sprite)
	screenHolder:insert(heykel2_Sprite)
	screenHolder:insert(playButton_Button)
	screenHolder:insert(creditsButton_Button)
	
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function GameMainScreen.addButtonEventListeners ()
	--[[
	

	newPopUpButton_Button.touch = newPopUpButtonTouchHandler
	newPopUpButton_Button:addEventListener("touch", newPopUpButton_Button)
	]]--
	playButton_Button.touch = playButtonTouchHandler
	playButton_Button:addEventListener("touch", playButton_Button)
	
	creditsButton_Button.touch = creditsButtonTouchHandler
	creditsButton_Button:addEventListener("touch", creditsButton_Button)

end

menuInCompleted = function (obj)
	GameMainScreen.addButtonEventListeners()
end

function GameMainScreen.playSound()
	musicList["mainMenuMusic"].play()
end

function GameMainScreen.menuIn ()
	GameMainScreen.playSound()

	loadScreen()

	screenHolder.alpha = 0
	transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 1})
end

function GameMainScreen.removeButtonEventListeners ()
	--[[
	creditsButton_Button.touch = nil
	creditsButton_Button:removeEventListener("touch", creditsButton_Button)

	newPopUpButton_Button.touch = nil
	newPopUpButton_Button:removeEventListener("touch", newPopUpButton_Button)
	]]--
	playButton_Button.touch = nil
	playButton_Button:removeEventListener("touch", playButton_Button)

end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GameMainScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	GameMainScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 500, transition = easing.linear, alpha = 0, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

return GameMainScreen
