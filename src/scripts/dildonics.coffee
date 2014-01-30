# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Replies with current level of fagocity

fagocity = 1

module.exports = (robot) ->
	robot.respond /dildonics$/i, (msg) ->
		msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."
		fagocity = fagocity + 1

		robot.respond /dedildonics$/i (msg) ->
			msg.send "Notice: fagocity level has been stabilized down to #{fagocity}."
			fagocity = fagocity - 1