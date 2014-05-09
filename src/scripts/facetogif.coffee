# Face to Gif
#
# Description:
#   Interfaces with our custom facetogif instance
#
# Commands:
#   gif me - Send me the link

		
module.exports = (robot) ->
	robot.respond /gif me$/i, (msg) ->
		console.log process.env
		host = process.env.HEROKU_URL || "http://localhost:8080"
		msg.send "#{host}/facetogif?user=#{msg.message.user.id}"
