# Description:
#   Hubot delivers a pic from Reddit's /r/aww frontpage
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   aww - Display the picture from /r/aww
#
# Author:
#   eliperkins

module.exports = (robot) ->
	robot.respond /aww+/i, (msg) ->
		awwfinder = /aww+/i
		awwmatch = awwfinder.exec msg.match[0]
		num = awwmatch[0].length-1
		if num > 20 then num = 20
		msg
		.http('http://imgur.com/r/aww.json')
			.get() (err, res, body) ->
				images = JSON.parse(body)
				images = images.data
				imageArray = new Array()
				while num -= 1
					image  = msg.random images
					imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
				msg.send image for image in imageArray
