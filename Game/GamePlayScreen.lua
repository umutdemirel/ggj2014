local GamePlayScreen = {}

local gameBackground_Sprite
local gameBackgroundButtonHolder_Sprite
local char1_Animation
local screenHolder
local buttonPressEnabled
local menuInCompleted
local menuOut
local menuOutCompleted
local addButtonEventListeners
local removeButtonEventListeners

local rotateLeftButton
local rotateRightButton
local glueButton
local backButton

local randomShape
local randomShapeCounter
local randomShapeGameOverValue = 15
local randomShapeList = {}
local randomShapeSpeed = 200
local generateRandomShape
local buttonThreshold = 20

local rotationSpeed = 90
local rotationState = 0

local randomShapeHolder
local glueHolder
local moveHolder

local touchXPoint
local isGameOver

local pixels = {}
local targetShape = {}

local remainingPieces
local showCounter

local siluet


local function backButtonTouchHandler(self, event)
	if isGameOver then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
	else
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
			isGameOver = true
			menuOut( GameOverScreenMenuID, false )
		end
	end
end

local function rotateLeftButtonTouchHandler(self, event)
	if isGameOver then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
	else
		if event.phase == "began" then
			if buttonPressEnabled then
				buttonPressEnabled = false
				event.target.pressed = true
				event.target:setSequence("infoOn")
				event.target:play()
				display.getCurrentStage():setFocus( event.target, event.id )
				event.target.focus = true
				rotationState = -1
			end
		elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
			if event.target.focus ~= true then
				return false
			end
			display.getCurrentStage():setFocus( nil )
			event.target:setSequence("infoIdle")
			event.target:play()
			buttonPressEnabled = true
			event.target.pressed = false
			--print("left button pressed")
			rotationState = 0
		end
	end
end

local function rotateRightButtonTouchHandler(self, event)
	if isGameOver then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
	else
		if event.phase == "began" then
			if buttonPressEnabled then
				buttonPressEnabled = false
				event.target.pressed = true
				event.target:setSequence("infoOn")
				event.target:play()
				display.getCurrentStage():setFocus( event.target, event.id )
				event.target.focus = true
				rotationState = 1
			end
		elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
			if event.target.focus ~= true then
				return false
			end
			display.getCurrentStage():setFocus( nil )
			event.target:setSequence("infoIdle")
			event.target:play()
			buttonPressEnabled = true
			event.target.pressed = false
			--print("right button pressed")
			rotationState = 0
		end
	end
end

local function glueButtonTouchHandler(self, event)
	if isGameOver then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
	else
		if event.phase == "began" then
			if buttonPressEnabled then
				buttonPressEnabled = false
				event.target.pressed = true
				event.target:setSequence("infoOn")
				event.target:play()
				display.getCurrentStage():setFocus( event.target, event.id )
				event.target.focus = true
			end
		elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
			if event.target.focus ~= true then
				return false
			end
			display.getCurrentStage():setFocus( nil )
			event.target:setSequence("infoIdle")
			event.target:play()
			buttonPressEnabled = true
			event.target.pressed = false
			randomShapeList[#randomShapeList].isGlued = true
			glueHolder:insert(randomShapeList[#randomShapeList])
			
			--print(glueHolder.x, glueHolder.y, randomShapeHolder.x, randomShapeHolder.y)
			--[[
			local xcos = math.cos(-glueHolder.rotation * math.pi / 180) * randomShapeList[#randomShapeList].x
			local xsin = math.sin(-glueHolder.rotation * math.pi / 180) * randomShapeList[#randomShapeList].x
			local ycos = math.cos(-glueHolder.rotation * math.pi / 180) * randomShapeList[#randomShapeList].y
			local ysin = math.sin(-glueHolder.rotation * math.pi / 180) * randomShapeList[#randomShapeList].y
			]]
			local xPos = randomShapeList[#randomShapeList].x - randomShapeHolder.x
			local yPos = randomShapeList[#randomShapeList].y - randomShapeHolder.height * 0.5-- display.contentHeight * 0.5 * 0.5
			--print(xPos, yPos)
			local xChange = randomShapeHolder.width * 0.5 + math.sin(glueHolder.rotation * math.pi / 180) * yPos 
			local yChange = randomShapeHolder.height * 0.5 + math.cos(glueHolder.rotation * math.pi / 180) * yPos
			--print(xChange, yChange, randomShapeList[#randomShapeList].x, randomShapeList[#randomShapeList].y, glueHolder.rotation)
			randomShapeList[#randomShapeList].x = xChange - (glueHolder.x - display.contentWidth * 0.5) * math.cos(glueHolder.rotation * math.pi / 180)
			randomShapeList[#randomShapeList].y = yChange + (glueHolder.x - display.contentWidth * 0.5) * math.sin (glueHolder.rotation * math.pi / 180)
			randomShapeList[#randomShapeList].rotation = -glueHolder.rotation

			sfxList["buttonClick_sfx"].play()

			local aabb = getAABB(randomShapeList[#randomShapeList].x, randomShapeList[#randomShapeList].y, randomShapeList[#randomShapeList].width, randomShapeList[#randomShapeList].height, randomShapeList[#randomShapeList].rotation)
			local iStart = math.round(aabb.boundingBox.left)
			local iEnd = math.round(aabb.boundingBox.left + aabb.boundingBox.width)
			local jStart = math.round(aabb.boundingBox.top)
			local jEnd = math.round(aabb.boundingBox.top + aabb.boundingBox.height)

			iStart = clampValue(iStart, 1, 640)
			iEnd = clampValue(iEnd, 1, 640)
			jStart = clampValue(jStart, 1, 640)
			jEnd = clampValue(jEnd, 1, 640)

			for i=iStart, iEnd, 1 do
				for j=jStart, jEnd, 1 do
					if pixels[j][i] ~= nil then
						if checkIfPointInsidePolygon(aabb.vertices, {i,j}) then
							pixels[j][i] = 1
						end
					end
				end
			end

			generateRandomShape()
		end
	end
end

local function moveHolderTouchHandler(self, event)
	if isGameOver then
		if event.target.focus ~= true then
			return false
		end
		display.getCurrentStage():setFocus( nil )
		buttonPressEnabled = true
		event.target.pressed = false
	else 
		if event.phase == "began" then
			if buttonPressEnabled then
				buttonPressEnabled = false
				event.target.pressed = true
				display.getCurrentStage():setFocus( event.target, event.id )
				event.target.focus = true
				touchXPoint = event.x
			end
		elseif event.phase == "moved" then
			glueHolder.x = glueHolder.x + (event.x - touchXPoint)
	
			if glueHolder.x < 0 then
				glueHolder.x = 0
			elseif glueHolder.x > display.contentWidth then
				glueHolder.x = display.contentWidth
			end 
			
			touchXPoint = event.x
		elseif (event.phase == "ended" or event.phase == "cancelled") and event.target.pressed == true then
			if event.target.focus ~= true then
				return false
			end
			display.getCurrentStage():setFocus( nil )
			buttonPressEnabled = true
			event.target.pressed = false
		end
	end
end

local function loadScreen ()
	screenHolder = display.newGroup()
	screenHolder.x = 0
	screenHolder.y = 0
	local screenHolderRect = display.newRect(screenHolder, 0, 0, display.contentWidth, display.contentHeight)
	screenHolderRect.alpha = 0

	buttonPressEnabled = true
	
	display.remove(gameBackground_Sprite)
	gameBackground_Sprite = nil
	gameBackground_Sprite = display.newSprite(spriteSheetsGame["gameBackground"], spriteSetsGame["gameBackground"])
	gameBackground_Sprite:setSequence("gameBackground")
	gameBackground_Sprite:play()
	gameBackground_Sprite:setReferencePoint(display.BottomCenterReferencePoint)
	gameBackground_Sprite.x = display.contentWidth * 0.5
	gameBackground_Sprite.y = display.contentHeight
	gameBackground_Sprite.xScale = 1
	gameBackground_Sprite.yScale = 1
	gameBackground_Sprite.alpha = 1
	gameBackground_Sprite.rotation = 0
	
	display.remove(gameBackgroundButtonHolder_Sprite)
	gameBackgroundButtonHolder_Sprite = nil
	gameBackgroundButtonHolder_Sprite = display.newImage("GGJ14_GameBackgroundButtonHolder.png")
	gameBackgroundButtonHolder_Sprite:setReferencePoint(display.CenterReferencePoint)
	gameBackgroundButtonHolder_Sprite.x = display.contentWidth * 0.5
	gameBackgroundButtonHolder_Sprite.y = display.contentHeight - gameBackgroundButtonHolder_Sprite.height * 0.5
	gameBackgroundButtonHolder_Sprite.xScale = 1
	gameBackgroundButtonHolder_Sprite.yScale = 1
	gameBackgroundButtonHolder_Sprite.alpha = 1
	gameBackgroundButtonHolder_Sprite.rotation = 0
	
	display.remove(backButton)
	backButton = nil
	backButton = display.newSprite(spriteSheetsGame["levelButtons"], spriteSetsGame["levelButtons"])
	backButton:setSequence("backIdle")
	backButton:play()
	backButton:setReferencePoint(display.CenterReferencePoint)
	backButton.x = backButton.width * 0.4
	backButton.y = backButton.height * 0.4
	backButton.xScale = 1
	backButton.yScale = 1
	backButton.alpha = 1
	backButton.rotation = 0
	
	display.remove(rotateLeftButton)
	rotateLeftButton = nil
	rotateLeftButton = display.newSprite(spriteSheetsShared["rotationButtons"], spriteSetsShared["rotationButtons"])
	rotateLeftButton:setSequence("CCWidle")
	rotateLeftButton:play()
	rotateLeftButton:setReferencePoint(display.CenterReferencePoint)
	rotateLeftButton.x = rotateLeftButton.width * 0.5
	rotateLeftButton.y = display.contentHeight - rotateLeftButton.height * 0.5
	rotateLeftButton.xScale = 1
	rotateLeftButton.yScale = 1
	rotateLeftButton.alpha = 1
	rotateLeftButton.rotation = 0
	
	display.remove(rotateRightButton)
	rotateRightButton = nil
	rotateRightButton = display.newSprite(spriteSheetsShared["rotationButtons"], spriteSetsShared["rotationButtons"])
	rotateRightButton:setSequence("CWidle")
	rotateRightButton:play()
	rotateRightButton:setReferencePoint(display.CenterReferencePoint)
	rotateRightButton.x = display.contentWidth - rotateRightButton.width * 0.5
	rotateRightButton.y = display.contentHeight - rotateRightButton.height * 0.5
	rotateRightButton.xScale = 1
	rotateRightButton.yScale = 1
	rotateRightButton.alpha = 1
	rotateRightButton.rotation = 0
	
	display.remove(glueButton)
	glueButton = nil
	glueButton = display.newSprite(spriteSheetsGame["glue"], spriteSetsGame["glue"])
	glueButton:setSequence("glueIdle")
	glueButton:play()
	glueButton:setReferencePoint(display.CenterReferencePoint)
	glueButton.x = display.contentWidth * 0.45
	glueButton.y = display.contentHeight - rotateLeftButton.height * 0.2
	glueButton.xScale = 1
	glueButton.yScale = 1
	glueButton.alpha = 1
	glueButton.rotation = 0
	
	buttonHolder = display.newGroup()
	buttonHolder.x = 0
	buttonHolder.y = 0
	buttonHolder:insert(backButton)
	buttonHolder:insert(glueButton)
	buttonHolder:insert(rotateRightButton)
	buttonHolder:insert(rotateLeftButton)
	
	randomShapeHolder = display.newGroup()
	randomShapeHolder.x = 0
	randomShapeHolder.y = 0
	local randomShapeHolderRect = display.newRect(randomShapeHolder, 0, 0, display.contentWidth, display.contentHeight * 0.5)
	randomShapeHolder:setReferencePoint(display.CenterReferencePoint)
	randomShapeHolderRect.alpha = 0
	randomShapeHolder.x = display.contentWidth * 0.5
	randomShapeHolder.y = display.contentHeight * 0.66
	
	glueHolder = display.newGroup()
	glueHolder.x = 0
	glueHolder.y = 0
	local glueHolderRect = display.newRect(glueHolder, 0, 0, display.contentWidth, display.contentHeight * 0.5)
	glueHolderRect.alpha = 0.01
	glueHolder:setReferencePoint(display.CenterReferencePoint)
	glueHolder.x = display.contentWidth * 0.5
	glueHolder.y = display.contentHeight * 0.66
	
	print(levelID, levelItem)
	display.remove(siluet)
	siluet = nil
	siluet = display.newSprite(spriteSheetsGame["siluet"], spriteSetsGame["siluet"])
	siluet:setSequence(levelID.."_"..levelItem)
	siluet:play()
	siluet:setReferencePoint(display.CenterReferencePoint)
	siluet.x = glueHolder.width * 0.5
	siluet.y = glueHolder.height * 0.5
	siluet.xScale = 1
	siluet.yScale = 1
	siluet.alpha = 0.5
	siluet.rotation = 0
	glueHolder:insert(siluet)
	
	moveHolder = display.newGroup()
	moveHolder.x = 0
	moveHolder.y = 0
	local moveHolderRect = display.newRect(moveHolder, 0, 0, display.contentWidth, display.contentHeight)
	moveHolder:setReferencePoint(display.TopLeftReferencePoint)
	moveHolderRect.alpha = 0.01
	
	for i=1, 640, 1 do
		pixels[i] = {}
		for j=1, 640, 1 do
			pixels[i][j] = 0
		end
	end

	readTargetShape(levelID, levelItem)
	remainingPieces = display.newText("", 0, 20, "PidginDance", 80)
	
	screenHolder:insert(gameBackground_Sprite)
	screenHolder:insert(remainingPieces)
	screenHolder:insert(gameBackgroundButtonHolder_Sprite)
	screenHolder:insert(glueHolder)
	screenHolder:insert(randomShapeHolder)
	screenHolder:insert(moveHolder)
	screenHolder:insert(buttonHolder)

	screenHolder:setReferencePoint(display.TopLeftReferencePoint)
end

function GamePlayScreen.addButtonEventListeners ()
	rotateLeftButton.touch = rotateLeftButtonTouchHandler
	rotateLeftButton:addEventListener("touch", rotateLeftButton)
	
	rotateRightButton.touch = rotateRightButtonTouchHandler
	rotateRightButton:addEventListener("touch", rotateRightButton)
	
	glueButton.touch = glueButtonTouchHandler
	glueButton:addEventListener("touch", glueButton)
	
	backButton.touch = backButtonTouchHandler
	backButton:addEventListener("touch", backButton)
	
	moveHolder.touch = moveHolderTouchHandler
	moveHolder:addEventListener("touch", moveHolder)
end

generateRandomShape = function ()
	showCounter((randomShapeGameOverValue - randomShapeCounter))
	if isGameOver == false and randomShapeCounter < randomShapeGameOverValue then
		randomShapeCounter = randomShapeCounter + 1
		randomShape = display.newSprite(randomShapeHolder, spriteSheetsGame["randomShapes"], spriteSetsGame["randomShapes"])
		randomShapeHolder:insert(randomShape)
		randomShape.isGlued = false
		local randomShapeIndex = 1 + math.floor( math.random() * 4 )
		randomShape:setSequence(randomShapeIndex)
		randomShape:play()
		randomShape:setReferencePoint(display.CenterReferencePoint)
		randomShape.x = display.contentWidth * 0.5
		randomShape.y = -display.contentHeight * 0.66 + randomShape.height * 0.5
		randomShape.xScale = 1
		randomShape.yScale = 1
		randomShape.alpha = 1
		randomShape.rotation = 0
		randomShapeList[#randomShapeList + 1] = randomShape
	else
		isGameOver = true
		display.getCurrentStage():setFocus( nil )
		
		score = getScore()
		score = clampValue(score, 0, 100)

		timer.performWithDelay(1000, function () menuOut( GameOverScreenMenuID, false ) end)
	end
end

local function iterateRandomShape()
	for index=1, #randomShapeList, 1 do
		--local shape = randomShapeList[index]
		if randomShapeList[index] ~= nil and randomShapeList[index].isGlued == false then
			randomShapeList[index].y = randomShapeList[index].y + deltaTime * randomShapeSpeed * 0.001
			if randomShapeList[index].y > display.contentHeight + randomShapeList[index].height * 0.5 then
				display.remove(randomShapeList[index])
				randomShapeList[index] = nil
				generateRandomShape()
			end
		end
	end
end

local function rotateGlue()
	glueHolder.rotation = glueHolder.rotation + deltaTime * rotationSpeed * 0.001 * rotationState
end

local function onEnterFrame(event)
	deltaTime = system.getTimer() - currentTime
	if deltaTime > 1000 then
		deltaTime = 1000/60
	elseif deltaTime < 0 then
		deltaTime = 1000/60
	end
	currentTime = system.getTimer()
	
	iterateRandomShape()
	rotateGlue()
end

menuInCompleted = function (obj)
	GamePlayScreen.addButtonEventListeners()
	Runtime:addEventListener("enterFrame", onEnterFrame)
	
	generateRandomShape()
end

function GamePlayScreen.playSound()
	musicList["gameBackgroundMusic"].play()
end

function GamePlayScreen.menuIn ()
	GamePlayScreen.playSound()

	randomShapeList = {}
	randomShapeCounter = 0
	isGameOver = false
	
	loadScreen()

	transition.to(screenHolder, {time = 10, onComplete = menuInCompleted})

	--timer.performWithDelay(40000, function () menuOut ( GameOverScreenMenuID ) end)
end

function GamePlayScreen.removeButtonEventListeners ()
end

menuOutCompleted = function ( nextScreenId, isNextScreenPopUp )
	if isNextScreenPopUp == true then
	else
		display.remove(screenHolder)
		screenHolder = nil

	end
	NextScreenId = nextScreenId
	PreviousScreenId = GamePlayScreenMenuID
	changeMenu(NextScreenId, PreviousScreenId, false, isNextScreenPopUp)
end

menuOut = function ( nextScreenId, isNextScreenPopUp )
	Runtime:removeEventListener("enterFrame", onEnterFrame)
	GamePlayScreen.removeButtonEventListeners()
	if isNextScreenPopUp == true then
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	else
		transition.to(screenHolder, {time = 10, onComplete = function () menuOutCompleted(nextScreenId, isNextScreenPopUp) end})
	end
end

checkIfPointInsidePolygon = function(vertices, point) 

	local n = 4
    local j
    local v1
    local v2
    local count = 0

    for index = 1, n, 1 do

    	if index == n then
    		j = 1
    	else
    		j = index + 1
    	end

    	v1 = vertices[index]
    	v2 = vertices[j]

    	if isLeft(point, v1, v2) then
    		if (point[2] > v1[2] and point[2] <= v2[2]) or (point[2] > v2[2] and point[2] <= v1[2]) then
    			count = count + 1
    		end
    	end
    end

    return not (count % 2 == 0)
end

isLeft = function(p, v1, v2)
	
	if v1[1] == v2[1] then
		if p[1] <= v1[1] then
			return true
		else
			return false
		end
	else
		local m = (v2[2] - v1[2]) / (v2[1] - v1[1])
		local x2 = (p[2] - v1[2]) / m + v1[1]

		if p[1] <= x2 then
			return true
		else
			return false
		end
	end
end

getAABB = function(centerX, centerY, width, height, rotation)
	--[[local tempRect = display.newRect(0,0,width, height)
	tempRect:setReferencePoint(display.CenterReferencePoint)
	tempRect.x = centerX
	tempRect.y = centerY
	tempRect.rotation = (rotation + 360) % 360
	tempRect.alpha = 0.5
	]]

	local tempRectRotation = (rotation + 360) % 360

	local newWidth = math.abs(height * math.sin(tempRectRotation * math.pi / 180)) + math.abs(width * math.cos(tempRectRotation * math.pi / 180))
	local newHeight = math.abs(width * math.sin(tempRectRotation * math.pi / 180)) + math.abs(height * math.cos(tempRectRotation * math.pi / 180))
	local newLeft = centerX - newWidth * 0.5
	local newTop = centerY - newHeight * 0.5
	
	--[[
	local tempRect2 = display.newRect(newLeft, newTop, newWidth, newHeight)
	tempRect2:setFillColor( 0, 255, 0 )
	tempRect2.alpha = 0.5
	]]

	local point1X = newLeft + math.abs(height * math.sin(tempRectRotation * math.pi / 180))
	if tempRectRotation > 90 and tempRectRotation <= 180 or tempRectRotation > 270 and tempRectRotation <= 360 then
		point1X = newLeft + newWidth - math.abs(height * math.sin(tempRectRotation * math.pi / 180))
	end
	local point1Y = newTop
	local point2X = newLeft
	local point2Y = newTop + newHeight - math.abs(width * math.sin(tempRectRotation * math.pi / 180))
	if tempRectRotation > 90 and tempRectRotation <= 180 or tempRectRotation > 270 and tempRectRotation <= 360 then
		point2Y = newTop + math.abs(width * math.sin(tempRectRotation * math.pi / 180))
	end
	local point3X = newLeft + math.abs(width * math.cos(tempRectRotation * math.pi / 180))
	if tempRectRotation > 90 and tempRectRotation <= 180 or tempRectRotation > 270 and tempRectRotation <= 360 then
		point3X = newLeft + newWidth - math.abs(width * math.cos(tempRectRotation * math.pi / 180))
	end
	local point3Y = newTop + newHeight
	local point4X = newLeft + newWidth
	local point4Y = newTop + math.abs(width * math.sin(tempRectRotation * math.pi / 180))
	if tempRectRotation > 90 and tempRectRotation <= 180 or tempRectRotation > 270 and tempRectRotation <= 360 then
		point4Y = newTop + newHeight - math.abs(width * math.sin(tempRectRotation * math.pi / 180))
	end
	
	--display.newCircle( point1X, point1Y, 5 )
	--display.newCircle( point2X, point2Y, 5 )
	--display.newCircle( point3X, point3Y, 5 )
	--display.newCircle( point4X, point4Y, 5 )
	--return {{newLeft, newTop}, {newLeft + newWidth, newTop}, {newLeft + newWidth, newTop + newHeight}, {newLeft, newTop + newHeight}}
	
	local result = {}
	result.boundingBox = {}
	result.boundingBox.left = newLeft
	result.boundingBox.top = newTop
	result.boundingBox.width = newWidth
	result.boundingBox.height = newHeight
	result.vertices = {
		{point1X, point1Y},
		{point2X, point2Y},
		{point3X, point3Y},
		{point4X, point4Y}
	}

	return result 
end

getScore = function ()
	
	local score = 0
	local numberOfOnes = 0


	for i=1, 640, 1 do
		for j=1, 640, 1 do
			if targetShape[i][j] + pixels[i][j] == 2 then
				score = score + 1
			elseif targetShape[i][j] + pixels[i][j] == 1 and pixels[i][j] == 1 then
				score = score - 0.005
			end

			if targetShape[i][j] == "1" then
				numberOfOnes = numberOfOnes + 1
			end
		end
	end

	return (score / numberOfOnes) * 100
end

readTargetShape = function (level, item)
	local path = system.pathForFile( "_level_"..level.."_"..item..".txt" )

	local file = io.open( path, "r" )

	local j = 1

	for lines in file:lines() do
        
        if j <= 640 then
        	targetShape[j] = {}
	        for i=1, 640, 1 do
	        	targetShape[j][i] = lines:sub(i, i)
	        end
	    end
        j = j + 1
    end

	io.close( file )
	file = nil
end

writeToFile = function (points, name)

	local saveData = ""
	local path = system.pathForFile( name, system.DocumentsDirectory )
	local file = io.open( path, "w" )
	
	for i=1, 640, 1 do
		for j=1, 640, 1 do
			saveData = saveData..points[i][j]
		end
		saveData = saveData.."\n"
	end

	file:write( saveData )
	io.close( file )
	file = nil
end

showCounter = function (textToDisplay)
	remainingPieces.text = textToDisplay
	remainingPieces:setReferencePoint(display.TopCenterReferencePoint);
	remainingPieces.x = display.contentWidth * 0.9
end

clampValue = function (value, min, max)
	if value > max then
		return max
	elseif value < min then
		return min
	else
		return value
	end
end

return GamePlayScreen


--[[

local centerX = 100
local centerY = 50
local width = 200
local height = 100
local rotation = 60

local vector = {50, 50}
local aabbPoints = getAABB(centerX, centerY, width, height, rotation)

local result = checkIfPointInsidePolygon(aabbPoints, vector)
print(result)

]]

--[[
local saveData = ""

for j=1, 640, 1 do
	for i=1, 640, 1 do
		saveData = saveData..pixels[i][j]
	end
	saveData = saveData.."\n"
end

local path = system.pathForFile( "currentShape.txt", system.DocumentsDirectory )
local file = io.open( path, "w" )
file:write( saveData )

io.close( file )
file = nil
]]