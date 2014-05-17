# typical_trendspace_response.coffee
#
# Description:
#   Returns a typical trendspace response / reaction.
#
# Commands:
#   hubot typical_trendspace_response - Returns a typical trendspace response / reaction.
#   hubot typical_trendspace_response add RESPONSE - Adds a typical trendspace response

module.exports = (robot) ->
	reactions = []
	robot.brain.on 'loaded', ->
		if robot.brain.data.reactions?
			reactions = robot.brain.data.reactions
		else reactions = [
			"Im gay"
			"Your gay"
			"http://critical-hit.org/img/kooki%20kookta%20ii.gif"
			"Fuck Meixel"
			"I am afraid I'm going to lose my job."
			"Lets do some coke"
			"Lets do some weed"
			"Lets do some beer"
			"Lets do some MDA"
			"Lets do some foxy"
			"Lets do some acid"
			"Lets do some shrooms"
			"Lets do some whip-its"
			"Lets do some champagne"
			"Time for a :shit:"
			"Life is "
			"Where is Miles"
			"Yo can I be real with you guys for a second"
			"Let's smoke legal illegal weeds in 7 minutes"
		]
		robot.brain.data.reactions = reactions


	robot.respond /(typical_trendspace_response|ttr)$/i, (msg) ->
		#console.log reaction[Math.floor(Math.random() * reaction.length)]
		msg.send reactions[Math.floor(Math.random() * reactions.length)]
		
	robot.respond /(typical_trendspace_response|ttr) add (.+)*$/i, (msg) ->
		reaction = msg.match[2]
		reactions.push reaction
		robot.brain.data.reactions = reactions
		msg.send "Added ' #{reaction} ' to Cronobase"