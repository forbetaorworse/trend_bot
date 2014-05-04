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
		console.log("Current level of fagocity: #{fagocity}")

	robot.respond /(dildonics|fagocity(?!( ?-)))( (\d+))?/i, (msg) ->
		if msg.match[3]
			fagocity += Number(msg.match[3])
		else
			fagocity += 1
		robot.brain.data.fagocity = fagocity
		msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."


	robot.respond /(dedildonics|fagocity( )?-)( (\d+))?/i, (msg) ->
		if msg.match[4]
			fagocity -= Number(msg.match[4])
		else
			fagocity -= 1
		robot.brain.data.fagocity = fagocity
		msg.send "Notice. Current level of fagocity in TRENDSPACE has been lowered to #{fagocity}."
