# Description:
#   The basement loves porn
#
# Commands:
#   hubot dick bomb N - get N dicks
#   hubot tit bomb N - get N tits
#   hubot porn bomb N - get N porns
#
# Author:
#   sonicboom

# adopted to T R E N D S P A C E
# By ERIC WESTBROOK MOTHERFUCKER - ERICWESTBROOK.NET

# Dick bomb
module.exports = (robot) ->
	robot.respond /dick bomb( (\d+))?/i, (msg) ->
		if msg.message.user.room?
			    count = msg.match[2] || 5
			    if count > 20 then count = 20
				msg.http("http://imgur.com/r/penis.json")
					.get() (err, res, body) ->
						images = JSON.parse(body)
						images = images.data
						imageArray = new Array()
						while (count -= 1)+1
							image = msg.random images
							imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
						msg.send image for image in imageArray
						
	robot.respond /tit bomb( (\d+))?/i, (msg) ->
		if msg.message.user.room?
			count = msg.match[2] || 5
			    if count > 20 then count = 20
				msg.http("http://imgur.com/r/boobies.json")
					.get() (err, res, body) ->
						images = JSON.parse(body)
						images = images.data
						imageArray = new Array()
						while (count -= 1) + 1
							image = msg.random images
							imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
						msg.send image for image in imageArray
						
	robot.respond /porn bomb( (\d+))?/i, (msg) ->
		if msg.message.user.room?
			    count = msg.match[2] || 5
			    if count > 20 then count = 20
				msg.http("http://imgur.com/r/porn.json")
					.get() (err, res, body) ->
						images = JSON.parse(body)
						images = images.data
						imageArray = new Array()
						while (count -= 1) + 1
							image = msg.random images
							imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
						msg.send image for image in imageArray
