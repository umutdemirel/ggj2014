if string.sub(system.getInfo("model"),1,4) == "iPad" then
	print ("iPad")
	application = 
	{
		content =
		{
			width = 768,
			height = 1024,
			scale = "none",
			fps = 60,
			graphicsCompatibility = 1,
		},
		notification =
		{
			iphone =
			{
				types =
				{
					"badge", "sound", "alert"
				}
			}
		},
	}
elseif string.sub(system.getInfo("model"),1,2) == "iP" and display.pixelHeight > 960 then
	print ("iPhone 5")
	application = 
	{
		content =
		{
			width = 640,
			height = 1136,
			scale = "none",
			fps = 60,
			graphicsCompatibility = 1,
		},
		notification =
		{
			iphone =
			{
				types =
				{
					"badge", "sound", "alert"
				}
			}
		},
	}
elseif string.sub(system.getInfo("model"),1,2) == "iP" and display.pixelHeight > 480 then
	print ("iPhone")
	application = 
	{
		content =
		{
			width = 640,
			height = 960,
			scale = "none",
			fps = 60,
			graphicsCompatibility = 1,
		},
		notification =
		{
			iphone =
			{
				types =
				{
					"badge", "sound", "alert"
				}
			}
		},
	}
elseif display.pixelHeight / display.pixelWidth > 1.72 then
	application = 
	{
		content =
		{
			width = 640,
			height = 1040,
			scale = "zoomStretch",
			fps = 60,
			graphicsCompatibility = 1,
		},
	}
else
	application = 
	{
		content =
		{
			width = 640,
			height = 1024,
			scale = "zoomStretch",
			fps = 60,
			graphicsCompatibility = 1,
		},
	}
end
