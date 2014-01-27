display.setStatusBar(display.HiddenStatusBar)
require 'Globals'
require 'Sound'
require 'AnimationsGame'
require 'AnimationsMenu'
require 'AnimationsShared'
mGameBackgroundManager = require 'GameBackgroundManager'
mTwitterManager = require "Twitter"
mFacebookManager = require "facebook"

local function startTheGame()
	local mGameManager = require 'GameManager'
	spriteSets = nil
	spriteSets = {}
	spriteSetsMenu = nil
	spriteSetsMenu = {}
	spriteSetsShared = nil
	spriteSetsShared = {}
	loadAnimationsMenu()
	loadAnimationsShared()
	math.randomseed(os.time())
	mGameManager.start()
end
timer.performWithDelay(100, startTheGame, 1)
