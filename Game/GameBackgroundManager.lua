local gameBackgroundManager = {}

gameBackgroundManager.background = {}
gameBackgroundManager.backgroundGroup = display.newGroup()
local backgroundScreens = {"background1Holder", "background2Holder", "background3Holder", }
if #backgroundScreens == 1 then
	backgroundScreens[2] = backgroundScreens[1]
end
local currentbackgroundIndex = 1
local backgroundSpeed = 0
local backgroundSpeedMultiplier = 0.2

gameBackgroundManager.foreground = {}
gameBackgroundManager.foregroundGroup = display.newGroup()
local foregroundScreens = {"foreground1Holder", "foreground2Holder", "foreground3Holder", }
if #foregroundScreens == 1 then
	foregroundScreens[2] = foregroundScreens[1]
end
local currentforegroundIndex = 1
local foregroundSpeed = 0
local foregroundSpeedMultiplier = 0.7

gameBackgroundManager.platform = {}
gameBackgroundManager.platformGroup = display.newGroup()
local platformScreens = {"platform1Holder", "platform2Holder", "platform3Holder", "platform4Holder", }
if #platformScreens == 1 then
	platformScreens[2] = platformScreens[1]
end
local currentplatformIndex = 1
local platformSpeed = 0
local platformSpeedMultiplier = 1

function gameBackgroundManager.setBackgroundSpeed(tempSpeed)
	backgroundSpeed = tempSpeed * backgroundSpeedMultiplier
	foregroundSpeed = tempSpeed * foregroundSpeedMultiplier
	platformSpeed = tempSpeed * platformSpeedMultiplier
end

function gameBackgroundManager.clearBackgrounds()
	display.remove(gameBackgroundManager.backgroundGroup)
	display.remove(gameBackgroundManager.foregroundGroup)
	display.remove(gameBackgroundManager.platformGroup)
end

function gameBackgroundManager.loadParallaxLayerbackground()
	gameBackgroundManager.backgroundGroup = display.newGroup()
	for i=1, #gameBackgroundManager.background, 1 do
		display.remove(gameBackgroundManager.background[i])
		gameBackgroundManager.background[i] = nil
	end
	gameBackgroundManager.background = {}
	gameBackgroundManager.backgroundGroup.x = 0
	gameBackgroundManager.backgroundGroup.y = 0

	--Parallax Layer background
	local i = 1 
	local background1Holder_0 = display.newGroup()
	background1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.background[i] = background1Holder_0
	display.remove(backgroundSprite1_Sprite)
	backgroundSprite1_Sprite = nil
	backgroundSprite1_Sprite_0 = display.newImageRect("Background2_01.png", 1136, 768)
	backgroundSprite1_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	backgroundSprite1_Sprite_0.x = 0 + 0 + 0
	backgroundSprite1_Sprite_0.y = 0 + 0 + 0
	backgroundSprite1_Sprite_0.xScale = 1
	backgroundSprite1_Sprite_0.yScale = 1
	backgroundSprite1_Sprite_0.alpha = 1
	backgroundSprite1_Sprite_0.rotation = 0
	background1Holder_0:insert(backgroundSprite1_Sprite_0)
	background1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.backgroundGroup:insert(background1Holder_0)
	gameBackgroundManager.background[i].x = (i-1) * background1Holder_0.width
	gameBackgroundManager.background[i].y = 0
	i = i + 1 

	local background2Holder_1 = display.newGroup()
	background2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.background[i] = background2Holder_1
	display.remove(backgroundSprite2_Sprite)
	backgroundSprite2_Sprite = nil
	backgroundSprite2_Sprite_1 = display.newImageRect("Background2_02.png", 1136, 768)
	backgroundSprite2_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	backgroundSprite2_Sprite_1.x = 0 + 0 + 0
	backgroundSprite2_Sprite_1.y = 0 + 0 + 0
	backgroundSprite2_Sprite_1.xScale = 1
	backgroundSprite2_Sprite_1.yScale = 1
	backgroundSprite2_Sprite_1.alpha = 1
	backgroundSprite2_Sprite_1.rotation = 0
	background2Holder_1:insert(backgroundSprite2_Sprite_1)
	background2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.backgroundGroup:insert(background2Holder_1)
	gameBackgroundManager.background[i].x = (i-1) * background2Holder_1.width
	gameBackgroundManager.background[i].y = 0
	i = i + 1 

	local background3Holder_2 = display.newGroup()
	background3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.background[i] = background3Holder_2
	display.remove(backgroundSprite3_Sprite)
	backgroundSprite3_Sprite = nil
	backgroundSprite3_Sprite_2 = display.newImageRect("Background2_03.png", 1136, 768)
	backgroundSprite3_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	backgroundSprite3_Sprite_2.x = 0 + 0 + 0
	backgroundSprite3_Sprite_2.y = 0 + 0 + 0
	backgroundSprite3_Sprite_2.xScale = 1
	backgroundSprite3_Sprite_2.yScale = 1
	backgroundSprite3_Sprite_2.alpha = 1
	backgroundSprite3_Sprite_2.rotation = 0
	background3Holder_2:insert(backgroundSprite3_Sprite_2)
	background3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.backgroundGroup:insert(background3Holder_2)
	gameBackgroundManager.background[i].x = (i-1) * background3Holder_2.width
	gameBackgroundManager.background[i].y = 0
	i = i + 1 

end

function gameBackgroundManager.loadParallaxLayerforeground()
	gameBackgroundManager.foregroundGroup = display.newGroup()
	for i=1, #gameBackgroundManager.foreground, 1 do
		display.remove(gameBackgroundManager.foreground[i])
		gameBackgroundManager.foreground[i] = nil
	end
	gameBackgroundManager.foreground = {}
	gameBackgroundManager.foregroundGroup.x = 0
	gameBackgroundManager.foregroundGroup.y = 0

	--Parallax Layer foreground
	local i = 1 
	local foreground1Holder_0 = display.newGroup()
	foreground1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foreground[i] = foreground1Holder_0
	display.remove(foregroundSprite1_Sprite)
	foregroundSprite1_Sprite = nil
	foregroundSprite1_Sprite_0 = display.newImageRect("foreground2_01.png", 1136, 768)
	foregroundSprite1_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	foregroundSprite1_Sprite_0.x = 0 + 0 + 0
	foregroundSprite1_Sprite_0.y = 0 + 0 + 0
	foregroundSprite1_Sprite_0.xScale = 1
	foregroundSprite1_Sprite_0.yScale = 1
	foregroundSprite1_Sprite_0.alpha = 1
	foregroundSprite1_Sprite_0.rotation = 0
	foreground1Holder_0:insert(foregroundSprite1_Sprite_0)
	foreground1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foregroundGroup:insert(foreground1Holder_0)
	gameBackgroundManager.foreground[i].x = (i-1) * foreground1Holder_0.width
	gameBackgroundManager.foreground[i].y = 0
	i = i + 1 

	local foreground2Holder_1 = display.newGroup()
	foreground2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foreground[i] = foreground2Holder_1
	display.remove(foregroundSprite2_Sprite)
	foregroundSprite2_Sprite = nil
	foregroundSprite2_Sprite_1 = display.newImageRect("foreground2_02.png", 1136, 768)
	foregroundSprite2_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	foregroundSprite2_Sprite_1.x = 0 + 0 + 0
	foregroundSprite2_Sprite_1.y = 0 + 0 + 0
	foregroundSprite2_Sprite_1.xScale = 1
	foregroundSprite2_Sprite_1.yScale = 1
	foregroundSprite2_Sprite_1.alpha = 1
	foregroundSprite2_Sprite_1.rotation = 0
	foreground2Holder_1:insert(foregroundSprite2_Sprite_1)
	foreground2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foregroundGroup:insert(foreground2Holder_1)
	gameBackgroundManager.foreground[i].x = (i-1) * foreground2Holder_1.width
	gameBackgroundManager.foreground[i].y = 0
	i = i + 1 

	local foreground3Holder_2 = display.newGroup()
	foreground3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foreground[i] = foreground3Holder_2
	display.remove(foregroundSprite3_Sprite)
	foregroundSprite3_Sprite = nil
	foregroundSprite3_Sprite_2 = display.newImageRect("foreground2_03.png", 1136, 768)
	foregroundSprite3_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	foregroundSprite3_Sprite_2.x = 0 + 0 + 0
	foregroundSprite3_Sprite_2.y = 0 + 0 + 0
	foregroundSprite3_Sprite_2.xScale = 1
	foregroundSprite3_Sprite_2.yScale = 1
	foregroundSprite3_Sprite_2.alpha = 1
	foregroundSprite3_Sprite_2.rotation = 0
	foreground3Holder_2:insert(foregroundSprite3_Sprite_2)
	foreground3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.foregroundGroup:insert(foreground3Holder_2)
	gameBackgroundManager.foreground[i].x = (i-1) * foreground3Holder_2.width
	gameBackgroundManager.foreground[i].y = 0
	i = i + 1 

end

function gameBackgroundManager.loadParallaxLayerplatform()
	gameBackgroundManager.platformGroup = display.newGroup()
	for i=1, #gameBackgroundManager.platform, 1 do
		display.remove(gameBackgroundManager.platform[i])
		gameBackgroundManager.platform[i] = nil
	end
	gameBackgroundManager.platform = {}
	gameBackgroundManager.platformGroup.x = 0
	gameBackgroundManager.platformGroup.y = 0

	--Parallax Layer platform
	local i = 1 
	local platform1Holder_0 = display.newGroup()
	platform1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platform[i] = platform1Holder_0
	display.remove(referenceSprite_Sprite)
	referenceSprite_Sprite = nil
	referenceSprite_Sprite_0 = display.newImageRect("referansSprite.png", 1136, 768)
	referenceSprite_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	referenceSprite_Sprite_0.x = 0 + 0 + 0
	referenceSprite_Sprite_0.y = 0 + 0 + 0
	referenceSprite_Sprite_0.xScale = 0.8450704225352113
	referenceSprite_Sprite_0.yScale = 1
	referenceSprite_Sprite_0.alpha = 1
	referenceSprite_Sprite_0.rotation = 0
	display.remove(platform4_Sprite)
	platform4_Sprite = nil
	platform4_Sprite_0 = display.newImageRect("platform2_01.png", 155, 400)
	platform4_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform4_Sprite_0.x = 770 + 0 + 0
	platform4_Sprite_0.y = 533 + 0 + 0
	platform4_Sprite_0.xScale = 1
	platform4_Sprite_0.yScale = 1
	platform4_Sprite_0.alpha = 1
	platform4_Sprite_0.rotation = 0
	display.remove(platform3_Sprite)
	platform3_Sprite = nil
	platform3_Sprite_0 = display.newImageRect("platform2_02.png", 155, 400)
	platform3_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform3_Sprite_0.x = 924 + 0 + 0
	platform3_Sprite_0.y = 533 + 0 + 0
	platform3_Sprite_0.xScale = 1
	platform3_Sprite_0.yScale = 1
	platform3_Sprite_0.alpha = 1
	platform3_Sprite_0.rotation = 0
	display.remove(platform5_Sprite)
	platform5_Sprite = nil
	platform5_Sprite_0 = display.newImageRect("platform2_03.png", 155, 400)
	platform5_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform5_Sprite_0.x = 304 + 0 + 0
	platform5_Sprite_0.y = 533 + 0 + 0
	platform5_Sprite_0.xScale = 1
	platform5_Sprite_0.yScale = 1
	platform5_Sprite_0.alpha = 1
	platform5_Sprite_0.rotation = 0
	display.remove(platform7_Sprite)
	platform7_Sprite = nil
	platform7_Sprite_0 = display.newImageRect("platform2_02.png", 155, 400)
	platform7_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform7_Sprite_0.x = 1078 + 0 + 0
	platform7_Sprite_0.y = 533 + 0 + 0
	platform7_Sprite_0.xScale = 1
	platform7_Sprite_0.yScale = 1
	platform7_Sprite_0.alpha = 1
	platform7_Sprite_0.rotation = 0
	display.remove(platform2_Sprite)
	platform2_Sprite = nil
	platform2_Sprite_0 = display.newImageRect("platform2_02.png", 155, 400)
	platform2_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform2_Sprite_0.x = 154 + 0 + 0
	platform2_Sprite_0.y = 533 + 0 + 0
	platform2_Sprite_0.xScale = 1
	platform2_Sprite_0.yScale = 1
	platform2_Sprite_0.alpha = 1
	platform2_Sprite_0.rotation = 0
	display.remove(platform1_Sprite)
	platform1_Sprite = nil
	platform1_Sprite_0 = display.newImageRect("platform2_02.png", 155, 400)
	platform1_Sprite_0:setReferencePoint(display.TopLeftReferencePoint)
	platform1_Sprite_0.x = 0 + 0 + 0
	platform1_Sprite_0.y = 533 + 0 + 0
	platform1_Sprite_0.xScale = 1
	platform1_Sprite_0.yScale = 1
	platform1_Sprite_0.alpha = 1
	platform1_Sprite_0.rotation = 0
	platform1Holder_0:insert(referenceSprite_Sprite_0)
	platform1Holder_0:insert(platform1_Sprite_0)
	platform1Holder_0:insert(platform2_Sprite_0)
	platform1Holder_0:insert(platform3_Sprite_0)
	platform1Holder_0:insert(platform4_Sprite_0)
	platform1Holder_0:insert(platform5_Sprite_0)
	platform1Holder_0:insert(platform7_Sprite_0)
	platform1Holder_0:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platformGroup:insert(platform1Holder_0)
	gameBackgroundManager.platform[i].x = (i-1) * platform1Holder_0.width
	gameBackgroundManager.platform[i].y = 0
	i = i + 1 

	local platform2Holder_1 = display.newGroup()
	platform2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platform[i] = platform2Holder_1
	display.remove(referenceSprite_Sprite)
	referenceSprite_Sprite = nil
	referenceSprite_Sprite_1 = display.newImageRect("referansSprite.png", 1136, 768)
	referenceSprite_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	referenceSprite_Sprite_1.x = 0 + 0 + 0
	referenceSprite_Sprite_1.y = 0 + 0 + 0
	referenceSprite_Sprite_1.xScale = 1
	referenceSprite_Sprite_1.yScale = 1
	referenceSprite_Sprite_1.alpha = 1
	referenceSprite_Sprite_1.rotation = 0
	display.remove(platform4_Sprite)
	platform4_Sprite = nil
	platform4_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform4_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform4_Sprite_1.x = 462 + 0 + 0
	platform4_Sprite_1.y = 533 + 0 + 0
	platform4_Sprite_1.xScale = 1
	platform4_Sprite_1.yScale = 1
	platform4_Sprite_1.alpha = 1
	platform4_Sprite_1.rotation = 0
	display.remove(platform9_Sprite)
	platform9_Sprite = nil
	platform9_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform9_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform9_Sprite_1.x = 1078 + 0 + 0
	platform9_Sprite_1.y = 533 + 0 + 0
	platform9_Sprite_1.xScale = 1
	platform9_Sprite_1.yScale = 1
	platform9_Sprite_1.alpha = 1
	platform9_Sprite_1.rotation = 0
	display.remove(platform3_Sprite)
	platform3_Sprite = nil
	platform3_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform3_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform3_Sprite_1.x = 308 + 0 + 0
	platform3_Sprite_1.y = 533 + 0 + 0
	platform3_Sprite_1.xScale = 1
	platform3_Sprite_1.yScale = 1
	platform3_Sprite_1.alpha = 1
	platform3_Sprite_1.rotation = 0
	display.remove(platform5_Sprite)
	platform5_Sprite = nil
	platform5_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform5_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform5_Sprite_1.x = 770 + 0 + 0
	platform5_Sprite_1.y = 533 + 0 + 0
	platform5_Sprite_1.xScale = 1
	platform5_Sprite_1.yScale = 1
	platform5_Sprite_1.alpha = 1
	platform5_Sprite_1.rotation = 0
	display.remove(platform6_Sprite)
	platform6_Sprite = nil
	platform6_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform6_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform6_Sprite_1.x = 616 + 0 + 0
	platform6_Sprite_1.y = 533 + 0 + 0
	platform6_Sprite_1.xScale = 1
	platform6_Sprite_1.yScale = 1
	platform6_Sprite_1.alpha = 1
	platform6_Sprite_1.rotation = 0
	display.remove(platform7_Sprite)
	platform7_Sprite = nil
	platform7_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform7_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform7_Sprite_1.x = 924 + 0 + 0
	platform7_Sprite_1.y = 533 + 0 + 0
	platform7_Sprite_1.xScale = 1
	platform7_Sprite_1.yScale = 1
	platform7_Sprite_1.alpha = 1
	platform7_Sprite_1.rotation = 0
	display.remove(platform2_Sprite)
	platform2_Sprite = nil
	platform2_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform2_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform2_Sprite_1.x = 154 + 0 + 0
	platform2_Sprite_1.y = 533 + 0 + 0
	platform2_Sprite_1.xScale = 1
	platform2_Sprite_1.yScale = 1
	platform2_Sprite_1.alpha = 1
	platform2_Sprite_1.rotation = 0
	display.remove(platform1_Sprite)
	platform1_Sprite = nil
	platform1_Sprite_1 = display.newImageRect("platform2_02.png", 155, 400)
	platform1_Sprite_1:setReferencePoint(display.TopLeftReferencePoint)
	platform1_Sprite_1.x = 0 + 0 + 0
	platform1_Sprite_1.y = 533 + 0 + 0
	platform1_Sprite_1.xScale = 1
	platform1_Sprite_1.yScale = 1
	platform1_Sprite_1.alpha = 1
	platform1_Sprite_1.rotation = 0
	platform2Holder_1:insert(referenceSprite_Sprite_1)
	platform2Holder_1:insert(platform1_Sprite_1)
	platform2Holder_1:insert(platform2_Sprite_1)
	platform2Holder_1:insert(platform3_Sprite_1)
	platform2Holder_1:insert(platform4_Sprite_1)
	platform2Holder_1:insert(platform5_Sprite_1)
	platform2Holder_1:insert(platform7_Sprite_1)
	platform2Holder_1:insert(platform6_Sprite_1)
	platform2Holder_1:insert(platform9_Sprite_1)
	platform2Holder_1:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platformGroup:insert(platform2Holder_1)
	gameBackgroundManager.platform[i].x = (i-1) * platform2Holder_1.width
	gameBackgroundManager.platform[i].y = 0
	i = i + 1 

	local platform3Holder_2 = display.newGroup()
	platform3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platform[i] = platform3Holder_2
	display.remove(referenceSprite_Sprite)
	referenceSprite_Sprite = nil
	referenceSprite_Sprite_2 = display.newImageRect("referansSprite.png", 1136, 768)
	referenceSprite_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	referenceSprite_Sprite_2.x = 0 + 0 + 0
	referenceSprite_Sprite_2.y = 0 + 0 + 0
	referenceSprite_Sprite_2.xScale = 1
	referenceSprite_Sprite_2.yScale = 1
	referenceSprite_Sprite_2.alpha = 1
	referenceSprite_Sprite_2.rotation = 0
	display.remove(platform3_Sprite)
	platform3_Sprite = nil
	platform3_Sprite_2 = display.newImageRect("platform2_01.png", 155, 400)
	platform3_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform3_Sprite_2.x = 770 + 0 + 0
	platform3_Sprite_2.y = 533 + 0 + 0
	platform3_Sprite_2.xScale = 1
	platform3_Sprite_2.yScale = 1
	platform3_Sprite_2.alpha = 1
	platform3_Sprite_2.rotation = 0
	display.remove(platform5_Sprite)
	platform5_Sprite = nil
	platform5_Sprite_2 = display.newImageRect("platform2_03.png", 155, 400)
	platform5_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform5_Sprite_2.x = 0 + 0 + 0
	platform5_Sprite_2.y = 533 + 0 + 0
	platform5_Sprite_2.xScale = 1
	platform5_Sprite_2.yScale = 1
	platform5_Sprite_2.alpha = 1
	platform5_Sprite_2.rotation = 0
	display.remove(platform6_Sprite)
	platform6_Sprite = nil
	platform6_Sprite_2 = display.newImageRect("platform2_01.png", 155, 400)
	platform6_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform6_Sprite_2.x = 256 + 0 + 0
	platform6_Sprite_2.y = 410 + 0 + 0
	platform6_Sprite_2.xScale = 1
	platform6_Sprite_2.yScale = 1
	platform6_Sprite_2.alpha = 1
	platform6_Sprite_2.rotation = 0
	display.remove(platform7_Sprite)
	platform7_Sprite = nil
	platform7_Sprite_2 = display.newImageRect("platform2_03.png", 155, 400)
	platform7_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform7_Sprite_2.x = 410 + 0 + 0
	platform7_Sprite_2.y = 410 + 0 + 0
	platform7_Sprite_2.xScale = 1
	platform7_Sprite_2.yScale = 1
	platform7_Sprite_2.alpha = 1
	platform7_Sprite_2.rotation = 0
	display.remove(platform2_Sprite)
	platform2_Sprite = nil
	platform2_Sprite_2 = display.newImageRect("platform2_02.png", 155, 400)
	platform2_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform2_Sprite_2.x = 924 + 0 + 0
	platform2_Sprite_2.y = 533 + 0 + 0
	platform2_Sprite_2.xScale = 1
	platform2_Sprite_2.yScale = 1
	platform2_Sprite_2.alpha = 1
	platform2_Sprite_2.rotation = 0
	display.remove(platform1_Sprite)
	platform1_Sprite = nil
	platform1_Sprite_2 = display.newImageRect("platform2_02.png", 155, 400)
	platform1_Sprite_2:setReferencePoint(display.TopLeftReferencePoint)
	platform1_Sprite_2.x = 1078 + 0 + 0
	platform1_Sprite_2.y = 533 + 0 + 0
	platform1_Sprite_2.xScale = 1
	platform1_Sprite_2.yScale = 1
	platform1_Sprite_2.alpha = 1
	platform1_Sprite_2.rotation = 0
	platform3Holder_2:insert(referenceSprite_Sprite_2)
	platform3Holder_2:insert(platform1_Sprite_2)
	platform3Holder_2:insert(platform2_Sprite_2)
	platform3Holder_2:insert(platform3_Sprite_2)
	platform3Holder_2:insert(platform5_Sprite_2)
	platform3Holder_2:insert(platform6_Sprite_2)
	platform3Holder_2:insert(platform7_Sprite_2)
	platform3Holder_2:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platformGroup:insert(platform3Holder_2)
	gameBackgroundManager.platform[i].x = (i-1) * platform3Holder_2.width
	gameBackgroundManager.platform[i].y = 0
	i = i + 1 

	local platform4Holder_3 = display.newGroup()
	platform4Holder_3:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platform[i] = platform4Holder_3
	display.remove(platform4_Sprite)
	platform4_Sprite = nil
	platform4_Sprite_3 = display.newImageRect("platform2_02.png", 155, 400)
	platform4_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform4_Sprite_3.x = 628 + 0 + 0
	platform4_Sprite_3.y = 440 + 0 + 0
	platform4_Sprite_3.xScale = 1
	platform4_Sprite_3.yScale = 1
	platform4_Sprite_3.alpha = 1
	platform4_Sprite_3.rotation = 0
	display.remove(platform3_Sprite)
	platform3_Sprite = nil
	platform3_Sprite_3 = display.newImageRect("platform2_02.png", 155, 400)
	platform3_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform3_Sprite_3.x = 474 + 0 + 0
	platform3_Sprite_3.y = 440 + 0 + 0
	platform3_Sprite_3.xScale = 1
	platform3_Sprite_3.yScale = 1
	platform3_Sprite_3.alpha = 1
	platform3_Sprite_3.rotation = 0
	display.remove(platform5_Sprite)
	platform5_Sprite = nil
	platform5_Sprite_3 = display.newImageRect("platform2_01.png", 155, 400)
	platform5_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform5_Sprite_3.x = 320 + 0 + 0
	platform5_Sprite_3.y = 440 + 0 + 0
	platform5_Sprite_3.xScale = 1
	platform5_Sprite_3.yScale = 1
	platform5_Sprite_3.alpha = 1
	platform5_Sprite_3.rotation = 0
	display.remove(platform6_Sprite)
	platform6_Sprite = nil
	platform6_Sprite_3 = display.newImageRect("platform2_03.png", 155, 400)
	platform6_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform6_Sprite_3.x = 782 + 0 + 0
	platform6_Sprite_3.y = 440 + 0 + 0
	platform6_Sprite_3.xScale = 1
	platform6_Sprite_3.yScale = 1
	platform6_Sprite_3.alpha = 1
	platform6_Sprite_3.rotation = 0
	display.remove(referenceSprite_Sprite)
	referenceSprite_Sprite = nil
	referenceSprite_Sprite_3 = display.newImageRect("referansSprite.png", 1136, 768)
	referenceSprite_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	referenceSprite_Sprite_3.x = 0 + 0 + 0
	referenceSprite_Sprite_3.y = 0 + 0 + 0
	referenceSprite_Sprite_3.xScale = 1
	referenceSprite_Sprite_3.yScale = 1
	referenceSprite_Sprite_3.alpha = 1
	referenceSprite_Sprite_3.rotation = 0
	display.remove(platform2_Sprite)
	platform2_Sprite = nil
	platform2_Sprite_3 = display.newImageRect("platform2_01.png", 155, 400)
	platform2_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform2_Sprite_3.x = 1078 + 0 + 0
	platform2_Sprite_3.y = 533 + 0 + 0
	platform2_Sprite_3.xScale = 1
	platform2_Sprite_3.yScale = 1
	platform2_Sprite_3.alpha = 1
	platform2_Sprite_3.rotation = 0
	display.remove(platform1_Sprite)
	platform1_Sprite = nil
	platform1_Sprite_3 = display.newImageRect("platform2_03.png", 155, 400)
	platform1_Sprite_3:setReferencePoint(display.TopLeftReferencePoint)
	platform1_Sprite_3.x = 0 + 0 + 0
	platform1_Sprite_3.y = 533 + 0 + 0
	platform1_Sprite_3.xScale = 1
	platform1_Sprite_3.yScale = 1
	platform1_Sprite_3.alpha = 1
	platform1_Sprite_3.rotation = 0
	platform4Holder_3:insert(referenceSprite_Sprite_3)
	platform4Holder_3:insert(platform1_Sprite_3)
	platform4Holder_3:insert(platform2_Sprite_3)
	platform4Holder_3:insert(platform3_Sprite_3)
	platform4Holder_3:insert(platform4_Sprite_3)
	platform4Holder_3:insert(platform5_Sprite_3)
	platform4Holder_3:insert(platform6_Sprite_3)
	platform4Holder_3:setReferencePoint(display.TopLeftReferencePoint)
	gameBackgroundManager.platformGroup:insert(platform4Holder_3)
	gameBackgroundManager.platform[i].x = (i-1) * platform4Holder_3.width
	gameBackgroundManager.platform[i].y = 0
	i = i + 1 

end

function gameBackgroundManager.loadBackgrounds()
	gameBackgroundManager.loadParallaxLayerbackground()
	gameBackgroundManager.loadParallaxLayerforeground()
	gameBackgroundManager.loadParallaxLayerplatform()
end

local function shiftbackground()
	gameBackgroundManager.backgroundGroup.x = 0
	gameBackgroundManager.backgroundGroup.y = 0
	local maxDist = 100000
	local closestScreenIndex = 0
	for i=1, #gameBackgroundManager.background, 1 do
		if math.abs(gameBackgroundManager.background[i].x) < maxDist then
			maxDist = math.abs(gameBackgroundManager.background[i].x)
			closestScreenIndex = i
		end
	end
	local nextScreenIndex
	while true do
		nextScreenIndex = 1 + math.floor(math.random() * #gameBackgroundManager.background)
		if nextScreenIndex ~= closestScreenIndex then
			break
		end
	end
	for i=1, #gameBackgroundManager.background, 1 do
		if i == closestScreenIndex then
			gameBackgroundManager.background[i].x = 0
		elseif i == nextScreenIndex then
			gameBackgroundManager.background[i].x = gameBackgroundManager.background[i].width
		else
			gameBackgroundManager.background[i].x = gameBackgroundManager.background[i].width * 2
		end
	end
end

local function shiftforeground()
	gameBackgroundManager.foregroundGroup.x = 0
	gameBackgroundManager.foregroundGroup.y = 0
	local maxDist = 100000
	local closestScreenIndex = 0
	for i=1, #gameBackgroundManager.foreground, 1 do
		if math.abs(gameBackgroundManager.foreground[i].x) < maxDist then
			maxDist = math.abs(gameBackgroundManager.foreground[i].x)
			closestScreenIndex = i
		end
	end
	local nextScreenIndex
	while true do
		nextScreenIndex = 1 + math.floor(math.random() * #gameBackgroundManager.foreground)
		if nextScreenIndex ~= closestScreenIndex then
			break
		end
	end
	for i=1, #gameBackgroundManager.foreground, 1 do
		if i == closestScreenIndex then
			gameBackgroundManager.foreground[i].x = 0
		elseif i == nextScreenIndex then
			gameBackgroundManager.foreground[i].x = gameBackgroundManager.foreground[i].width
		else
			gameBackgroundManager.foreground[i].x = gameBackgroundManager.foreground[i].width * 2
		end
	end
end

local function shiftplatform()
	gameBackgroundManager.platformGroup.x = 0
	gameBackgroundManager.platformGroup.y = 0
	local maxDist = 100000
	local closestScreenIndex = 0
	for i=1, #gameBackgroundManager.platform, 1 do
		if math.abs(gameBackgroundManager.platform[i].x) < maxDist then
			maxDist = math.abs(gameBackgroundManager.platform[i].x)
			closestScreenIndex = i
		end
	end
	local nextScreenIndex
	while true do
		nextScreenIndex = 1 + math.floor(math.random() * #gameBackgroundManager.platform)
		if nextScreenIndex ~= closestScreenIndex then
			break
		end
	end
	for i=1, #gameBackgroundManager.platform, 1 do
		if i == closestScreenIndex then
			gameBackgroundManager.platform[i].x = 0
		elseif i == nextScreenIndex then
			gameBackgroundManager.platform[i].x = gameBackgroundManager.platform[i].width
		else
			gameBackgroundManager.platform[i].x = gameBackgroundManager.platform[i].width * 2
		end
	end
end

function gameBackgroundManager.slideBackgrounds()
	for i=1, #gameBackgroundManager.background, 1 do
		gameBackgroundManager.background[i].x = gameBackgroundManager.background[i].x - backgroundSpeed * deltaTime * 0.01
	end
	for i=1, #gameBackgroundManager.background, 1 do
		if gameBackgroundManager.background[i].x < -gameBackgroundManager.background[i].width then
			shiftbackground()
			break
		end
	end
	for i=1, #gameBackgroundManager.foreground, 1 do
		gameBackgroundManager.foreground[i].x = gameBackgroundManager.foreground[i].x - foregroundSpeed * deltaTime * 0.01
	end
	for i=1, #gameBackgroundManager.foreground, 1 do
		if gameBackgroundManager.foreground[i].x < -gameBackgroundManager.foreground[i].width then
			shiftforeground()
			break
		end
	end
	for i=1, #gameBackgroundManager.platform, 1 do
		gameBackgroundManager.platform[i].x = gameBackgroundManager.platform[i].x - platformSpeed * deltaTime * 0.01
	end
	for i=1, #gameBackgroundManager.platform, 1 do
		if gameBackgroundManager.platform[i].x < -gameBackgroundManager.platform[i].width then
			shiftplatform()
			break
		end
	end
end

function gameBackgroundManager.start()
	gameBackgroundManager.setBackgroundSpeed(20)
end

function gameBackgroundManager.stop()
	gameBackgroundManager.clearBackgrounds()
end

return gameBackgroundManager
