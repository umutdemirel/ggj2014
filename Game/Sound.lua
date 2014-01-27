musicList = {}
sfxList = {}
currentlyPlayingMusic = ""

local gameBackgroundMusic = {}
gameBackgroundMusic.sound = audio.loadStream("GGJ14_Game_Bg_Music.mp3")
gameBackgroundMusic.channel = 1
gameBackgroundMusic.play = function()
	audio.rewind( gameBackgroundMusic.sound )
	audio.play( gameBackgroundMusic.sound, { channel = gameBackgroundMusic.channel, loops = -1 } )
	currentlyPlayingMusic = "gameBackgroundMusic"
end
gameBackgroundMusic.stop = function()
	audio.stop( gameBackgroundMusic.channel )
	currentlyPlayingMusic = ""
end
gameBackgroundMusic.pause = function()
	audio.pause ( gameBackgroundMusic.channel )
end
gameBackgroundMusic.resume = function()
	audio.resume ( gameBackgroundMusic.channel )
end
musicList["gameBackgroundMusic"] = gameBackgroundMusic

local mainMenuMusic = {}
mainMenuMusic.sound = audio.loadStream("GGJ14_Main_Menu_Music.mp3")
mainMenuMusic.channel = 2
mainMenuMusic.play = function()
	audio.rewind( mainMenuMusic.sound )
	audio.play( mainMenuMusic.sound, { channel = mainMenuMusic.channel, loops = -1 } )
	currentlyPlayingMusic = "mainMenuMusic"
end
mainMenuMusic.stop = function()
	audio.stop( mainMenuMusic.channel )
	currentlyPlayingMusic = ""
end
mainMenuMusic.pause = function()
	audio.pause ( mainMenuMusic.channel )
end
mainMenuMusic.resume = function()
	audio.resume ( mainMenuMusic.channel )
end
musicList["mainMenuMusic"] = mainMenuMusic

local buttonClick_sfx = {}
buttonClick_sfx.sound = audio.loadSound("GGJ14_Fick.mp3")
buttonClick_sfx.channel = 11
buttonClick_sfx.play = function()
	audio.play( buttonClick_sfx.sound, { channel = buttonClick_sfx.channel } )
end
sfxList["buttonClick_sfx"] = buttonClick_sfx

local highFive_sfx = {}
highFive_sfx.sound = audio.loadSound("GGJ14_High_Five.mp3")
highFive_sfx.channel = 12
highFive_sfx.play = function()
	audio.play( highFive_sfx.sound, { channel = highFive_sfx.channel } )
end
sfxList["highFive_sfx"] = highFive_sfx