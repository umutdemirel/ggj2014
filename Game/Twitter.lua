module(..., package.seeall)

local oAuth = require "oAuth"
local json = require("json")

consumer_key = "jsr99cMfRkt2pcXaYUl4rw"
consumer_secret = "SrDCCS0vVe4lVe8JgxRAs0o1bwunI9Cm42oxGse0ng"

webURL = "http://www.oyundongusu.com/"

local access_token
local access_token_secret
local user_id
local screen_name

local postMessage
local delegate

local doTweet

if not consumer_key or not consumer_secret then
	local function onComplete( event )
		if event.index == 1 then
			system.openURL( "https://dev.twitter.com//" )
		end
	end
	native.showAlert( "Error", "To develop for Twitter, you need to get an API key and application secret. This is available from Twitter's website.", { "Learn More", "Cancel" }, onComplete )
end

local function webListener(event)
	print("listener: ", event.url)
	local remain_open = true
	local url = event.url

	if url:find("oauth_token") and url:find(webURL) then
		local function accessToken_ret( status, access_response )
			access_response = responseToTable( access_response, {"=", "&"} )
			access_token = access_response.oauth_token
			access_token_secret = access_response.oauth_token_secret
			user_id = access_response.user_id
			screen_name = access_response.screen_name
			if not access_token then
				return
			end
			print( "Tweeting" )
			doTweet()
		end
		url = url:sub(url:find("?") + 1, url:len())

		local authorize_response = responseToTable(url, {"=", "&"})
		remain_open = false

		oAuth.getAccessToken(authorize_response.oauth_token,
			authorize_response.oauth_verifier, twitter_request_token_secret, consumer_key,
			consumer_secret, "https://api.twitter.com/oauth/access_token", accessToken_ret )
	elseif url:find(webURL) then
		remain_open = false
		delegate.twitterCancel()
	end
	return remain_open
end

function responseToTable(str, delimeters)
	local obj = {}

	while str:find(delimeters[1]) ~= nil do
		if #delimeters > 1 then
			local key_index = 1
			local val_index = str:find(delimeters[1])
			local key = str:sub(key_index, val_index - 1)

			str = str:sub((val_index + delimeters[1]:len()))

			local end_index
			local value

			if str:find(delimeters[2]) == nil then
				end_index = str:len()
				value = str
			else
				end_index = str:find(delimeters[2])
				value = str:sub(1, (end_index - 1))
				str = str:sub((end_index + delimeters[2]:len()), str:len())
			end
			obj[key] = value
		else
			local val_index = str:find(delimeters[1])
			str = str:sub((val_index + delimeters[1]:len()))

			local end_index
			local value

			if str:find(delimeters[1]) == nil then
				end_index = str:len()
				value = str
			else
				end_index = str:find(delimeters[1])
				value = str:sub(1, (end_index - 1))
				str = str:sub(end_index, str:len())
			end
			obj[#obj + 1] = value
		end
	end
	return obj
end

function tweet(del, msg)
	postMessage = msg
	delegate = del

	if not access_token then
		function tweetAuth_ret( status, result )
			local twitter_request_token = result:match('oauth_token=([^&]+)')
			local twitter_request_token_secret = result:match('oauth_token_secret=([^&]+)')
			if not twitter_request_token then
				print("No valid token received. Abort")
				delegate.twitterFailed()
				return
			end
			native.showWebPopup(0, 0, display.contentWidth, display.contentHeight, "https://api.twitter.com/oauth/authenticate?oauth_token=" .. twitter_request_token, {urlRequest = webListener})
		end

		if not consumer_key or not consumer_secret then
			print("no consumer or secret")
			delegate.twitterFailed()
			return
		end

		local twitter_request = (oAuth.getRequestToken(consumer_key, webURL, "https://api.twitter.com/oauth/request_token", consumer_secret, tweetAuth_ret))
	else
		print( "Tweeting" )
		doTweet()
	end
end

function doTweet()
	local values = postMessage

	function doTweetCallback( status, result )
		local response = json.decode( result )
		delegate.twitterSuccess( values[1], screen_name, response )
	end

	local params = {}

	if #values > 3 then
		for i = 4, #values do
			params[i-3] = { key = values[i][1], value = values[i][2] }
			if params[i-3].value == "SELF" then 
				params[i-3].value = screen_name
			end
		end
	end

	oAuth.makeRequest("https://api.twitter.com/1.1/" .. values[2], params, consumer_key, access_token, consumer_secret, access_token_secret, values[3], doTweetCallback )
end
