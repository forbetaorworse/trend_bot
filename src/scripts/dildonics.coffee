# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Raises current level of fagocity
#   hubot dedildonics - Lowers current level of fagocity

module.exports = (robot) ->
	fagocity = 0
	robot.brain.on 'loaded', ->
		if robot.brain.data.fagocity?
			fagocity = robot.brain.data.fagocity
		else fagocity = 1
		console.log("Here you go, fag: #{fagocity}")

	robot.respond /dildonics$/i, (msg) ->
		fagocity+=1
		robot.brain.data.fagocity = fagocity
		robot.brain.emit 'save'
		msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."


	robot.respond /dedildonics$/i, (msg) ->
		fagocity-=1
		robot.brain.data.fagocity = fagocity
		robot.brain.emit 'save'
		msg.send "Notice. Current level of fagocity in TRENDSPACE has now stabalized to #{fagocity}."