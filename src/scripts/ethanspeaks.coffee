# Description:
#   gets a random EthanSpeaks
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ethanspeaks - Show a random EthanSpeaks
#
# Author:
#   SonicBoom
#
module.exports = (robot) ->
	robot.respond /(ethanspeaks)/i, (msg) ->
		msg.http("http://api.twitter.com/1/statuses/user_timeline/ethanspeaks.json?include_rts=false&exclude_replies=true&trim_user=true&count=200")
			.get() (err, res, body) ->
				response = JSON.parse body
				status = Math.floor(Math.random() * 200) + 1
				if response[0]
					msg.send "https://twitter.com/ethanspeaks/status/#{response[status]['id_str']}"
				else
					msg.send "Error"