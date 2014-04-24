# typical_trendspace_response.coffee
#
# Description:
#   Returns a typical trendspace response / reaction.
#
# Commands:
#   hubot typical_trendspace_response - Returns a typical trendspace response / reaction.

# useless variable
fagocity = 133780085

# reaction array
reaction = [
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

module.exports = (robot) ->
	robot.respond /typical_trendspace_response$/i, (msg) ->
		#console.log reaction[Math.floor(Math.random() * reaction.length)]
		msg.send reaction[Math.floor(Math.random() * reaction.length)]
		
module.exports = (robot) ->
	robot.respond /ttr$/i, (msg) ->
		#console.log reaction[Math.floor(Math.random() * reaction.length)]
		msg.send reaction[Math.floor(Math.random() * reaction.length)]


		#msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."