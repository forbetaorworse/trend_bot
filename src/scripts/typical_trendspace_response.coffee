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
	"I'm afraid that I'm going to lose my job."
	"lol ya thaz dope. ah ah. hit tha movug mah ah ah"
	"I am afraid I'm going to lose my job."
	"Time for a :shit:"
	"Time for a :shit: :shit: :shit: :shit: :shit: :shit: :shit: :shit:"
	"Life is meaningless"
	"No one likes you"
	"Please leave this chat room"
]

module.exports = (robot) ->
	robot.respond /typical_trendspace_response$/i, (msg) ->
		#console.log reaction[Math.floor(Math.random() * reaction.length)]
		msg.send reaction[Math.floor(Math.random() * reaction.length)]
		


		#msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."