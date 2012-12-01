# Description:
#   Tech bomb!
#
# Commands:
#   hubot tech bomb N - get N nerdgasms
#
# Author:
#   sonicboom

module.exports = (robot) ->
	robot.respond /tech bomb( (\d+))?/i, (msg) ->
		count = msg.match[2] || 5
		if count > 20 then count = 20
		msg.http("http://imgur.com/r/sysadmin.json")
			.get() (err, res, body) ->
				images = JSON.parse(body)
				images = images.data
				imageArray = new Array()
				while (count -= 1)+1
					image = msg.random images
					imageURL = "http://i.imgur.com/#{image.hash}#{image.ext}"
					if findDupes imageURL, imageArray
						count++
						continue
					imageArray.push imageURL
				msg.send image for image in imageArray

findDupes = (item, array) ->
	for stored in array
		if item is stored
			return true
	return false