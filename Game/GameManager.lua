local gameManager = {}
local m_GameOverScreen = require 'GameOverScreen'
require 'GameLoadingScreen'
local m_GamePlayScreen = require 'GamePlayScreen'
local m_GameSplashScreen = require 'GameSplashScreen'
local m_GameMainScreen = require 'GameMainScreen'
local m_CreditsScreen = require 'CreditsScreen'
local m_GameLevelSelectScreen = require 'GameLevelSelectScreen'
local m_GameLevel1 = require 'GameLevel1'
local m_GameLevel2 = require 'GameLevel2'
local m_GameLevel3 = require 'GameLevel3'

function gameManager.start()
	loadGameLoadingScreen()
	hideGameLoadingScreen()
	m_GameSplashScreen.menuIn()
	--m_GameLevelSelectScreen.menuIn()
end

function changeMenu(nextMenu, previousMenu, isPreviousScreenPopUp, isNextScreenPopUp)

	if nextMenu == GameLevel1MenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				--showGameLoadingScreen()
				timer.performWithDelay(20, function ()
					--hideGameLoadingScreen()
					m_GameLevel1.menuIn()
					end, 1)
			else
				m_GameLevel1.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_GameLevel1.playSound();
				m_GameLevel1.addButtonEventListeners()
			else
				m_GameLevel1.playSound();
				m_GameLevel1.addButtonEventListeners()
			end
		end
	end
	
	if nextMenu == GameLevel2MenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				--showGameLoadingScreen()
				timer.performWithDelay(20, function ()
					--hideGameLoadingScreen()
					m_GameLevel2.menuIn()
					end, 1)
			else
				m_GameLevel2.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_GameLevel2.playSound();
				m_GameLevel2.addButtonEventListeners()
			else
				m_GameLevel2.playSound();
				m_GameLevel2.addButtonEventListeners()
			end
		end
	end
	
	if nextMenu == GameLevel3MenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				--showGameLoadingScreen()
				timer.performWithDelay(20, function ()
					--hideGameLoadingScreen()
					m_GameLevel3.menuIn()
					end, 1)
			else
				m_GameLevel3.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_GameLevel3.playSound();
				m_GameLevel3.addButtonEventListeners()
			else
				m_GameLevel3.playSound();
				m_GameLevel3.addButtonEventListeners()
			end
		end
	end
	
	if nextMenu == GameLevelSelectScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				--showGameLoadingScreen()
				timer.performWithDelay(20, function ()
					--hideGameLoadingScreen()
					m_GameLevelSelectScreen.menuIn()
					end, 1)
			else
				m_GameLevelSelectScreen.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_GameLevelSelectScreen.playSound();
				m_GameLevelSelectScreen.addButtonEventListeners()
			else
				m_GameLevelSelectScreen.playSound();
				m_GameLevelSelectScreen.addButtonEventListeners()
			end
		end
	end
	
	if nextMenu == GameOverScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		showGameLoadingScreen()
		timer.performWithDelay(2000, function ()
			releaseAnimationsGame()
			timer.performWithDelay(1000, loadAnimationsMenu, 1)
			timer.performWithDelay(2000, function ()
				hideGameLoadingScreen()
				m_GameOverScreen.menuIn()
				end, 1)
			end, 1)
	end




	if nextMenu == GamePlayScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		showGameLoadingScreen()
		timer.performWithDelay(1000, function ()
			releaseAnimationsMenu()
			timer.performWithDelay(1000, loadAnimationsGame, 1)
			timer.performWithDelay(2000, function ()
				hideGameLoadingScreen()
				m_GamePlayScreen.menuIn()
				end, 1)
			end, 1)
	end

	if nextMenu == GameSplashScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
	end

	if nextMenu == GameMainScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				showGameLoadingScreen()
				timer.performWithDelay(2000, function ()
					hideGameLoadingScreen()
					m_GameMainScreen.menuIn()
					end, 1)
			else
				m_GameMainScreen.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_GameMainScreen.playSound();
				m_GameMainScreen.addButtonEventListeners()
			else
				m_GameMainScreen.playSound();
				m_GameMainScreen.addButtonEventListeners()
			end
		end
	end



	if nextMenu == CreditsScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				--showGameLoadingScreen()
				timer.performWithDelay(20, function ()
					--hideGameLoadingScreen()
					m_CreditsScreen.menuIn()
					end, 1)
			else
				m_CreditsScreen.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_CreditsScreen.playSound();
				m_CreditsScreen.addButtonEventListeners()
			else
				m_CreditsScreen.playSound();
				m_CreditsScreen.addButtonEventListeners()
			end
		end
	end

	if nextMenu == extraScreenMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				showGameLoadingScreen()
				timer.performWithDelay(2000, function ()
					hideGameLoadingScreen()
					m_extraScreen.menuIn()
					end, 1)
			else
				m_extraScreen.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_extraScreen.playSound();
				m_extraScreen.addButtonEventListeners()
			else
				m_extraScreen.playSound();
				m_extraScreen.addButtonEventListeners()
			end
		end
	end



	if nextMenu == NewPopUpMenuID then
		if currentlyPlayingMusic ~= "" then
			musicList[currentlyPlayingMusic].stop()
		end
		if isPreviousScreenPopUp == false then
			if isNextScreenPopUp == false then
				showGameLoadingScreen()
				timer.performWithDelay(2000, function ()
					hideGameLoadingScreen()
					m_NewPopUp.menuIn()
					end, 1)
			else
				m_NewPopUp.menuIn()
			end
		else
			if isNextScreenPopUp == false then
				m_NewPopUp.playSound();
				m_NewPopUp.addButtonEventListeners()
			else
				m_NewPopUp.playSound();
				m_NewPopUp.addButtonEventListeners()
			end
		end
	end

end
return gameManager
