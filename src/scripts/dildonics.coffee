# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Replies with current level of fagocity

fagocity = 0

module.exports = (robot) ->
	robot.respond /dildonics$/i, (msg) ->
		fagocity+=1
		msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."

		robot.respond /dedildonics$/i (msg) ->
			fagocity-=1
			msg.send "Notice: fagocity level has been stabilized down to #{fagocity}."
