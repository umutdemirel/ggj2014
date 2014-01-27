local GameLoadingScreen = {}

local loadingImage_Sprite
local acidooo_Animation
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local bez_Sprite
local el_Sprite

function GameLoadingScreen.playSound()
	local camSilSFX = {}
	camSilSFX.sound = audio.loadSound("GGJ14_Cam_Sil.mp3")
	camSilSFX.channel = 2
	audio.play( camSilSFX.sound, { channel = camSilSFX.channel } )
end

function loadGameLoadingScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.contentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true

	display.remove(loadingImage_Sprite)
	loadingImage_Sprite = nil
	
	loadingImage_Sprite = display.newSprite(spriteSheetsShared["loading"], spriteSetsShared["loading"])
	loadingImage_Sprite:setSequence("loading")
	loadingImage_Sprite:play()
	loadingImage_Sprite:setReferencePoint(display.CenterReferencePoint)
	loadingImage_Sprite.x = display.contentWidth * 0.5
	loadingImage_Sprite.y = display.contentHeight * 0.5
	loadingImage_Sprite.xScale = 1
	loadingImage_Sprite.yScale = 1
	loadingImage_Sprite.alpha = 1
	loadingImage_Sprite.rotation = 0
	
	display.remove(bez_Sprite)
	bez_Sprite = nil
	bez_Sprite = display.newImage("GGJ14_Bez.png")
	bez_Sprite:setReferencePoint(display.TopCenterReferencePoint)
	bez_Sprite.x = display.contentWidth * 0.5
	bez_Sprite.y = display.contentHeight * 0.2
	bez_Sprite.xScale = 1
	bez_Sprite.yScale = 1
	bez_Sprite.alpha = 1
	bez_Sprite.rotation = 0
	
	local bezStartX = display.contentWidth * 0.5
	local bezStartY = display.contentHeight * 0.2
	transition.to(bez_Sprite, {time = 500, rotation=0, x = bezStartX + 60, y = bezStartY - 60 })
	transition.to(bez_Sprite, {delay = 500, time = 500, rotation=0, x = bezStartX, y = bezStartY })
	
	transition.to(bez_Sprite, {delay = 1000, time = 500, rotation=0, x = bezStartX + 60, y = bezStartY - 60 })
	transition.to(bez_Sprite, {delay = 1500, time = 500, rotation=0, x = bezStartX, y = bezStartY })
	
	transition.to(bez_Sprite, {delay = 2000, time = 500, rotation=0, x = bezStartX + 60, y = bezStartY - 60 })
	transition.to(bez_Sprite, {delay = 2500, time = 500, rotation=0, x = bezStartX, y = bezStartY })
	
	display.remove(el_Sprite)
	el_Sprite = nil
	el_Sprite = display.newImage("GGJ14_El.png")
	el_Sprite:setReferencePoint(display.BottomRightReferencePoint)
	el_Sprite.x = display.contentWidth + 50
	el_Sprite.y = display.contentHeight * 0.65
	el_Sprite.xScale = 1
	el_Sprite.yScale = 1
	el_Sprite.alpha = 1
	el_Sprite.rotation = 0
	transition.to(el_Sprite, {time = 500, rotation=15})
	transition.to(el_Sprite, {delay = 500, time = 500, rotation=0})
	
	transition.to(el_Sprite, {delay = 1000, time = 500, rotation=15})
	transition.to(el_Sprite, {delay = 1500, time = 500, rotation=0})
	
	transition.to(el_Sprite, {delay = 2000, time = 500, rotation=15})
	transition.to(el_Sprite, {delay = 2500, time = 500, rotation=0})
	
	display.remove(loadingText_Sprite)
	loadingText_Sprite = nil
	loadingText_Sprite = display.newImage("GGJ14_Loading.png")
	loadingText_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	loadingText_Sprite.x = display.contentWidth * 0.5
	loadingText_Sprite.y = display.contentHeight + 50
	loadingText_Sprite.xScale = 1
	loadingText_Sprite.yScale = 1
	loadingText_Sprite.alpha = 1
	loadingText_Sprite.rotation = 0

	screenHolder:insert(loadingImage_Sprite)
	screenHolder:insert(bez_Sprite)
	screenHolder:insert(el_Sprite)
	screenHolder:insert(loadingText_Sprite)
	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function showGameLoadingScreen()
	loadGameLoadingScreen()
	GameLoadingScreen.playSound()
end

function hideGameLoadingScreen()
	display.remove(screenHolder)
	screenHolder = nil
end

