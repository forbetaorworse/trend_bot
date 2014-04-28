# typical_trendspace_response.coffee
#
# Description:
#   Returns a COOL response.
#
# Commands:
#   hubot cool - Returns a COOL response.


# reaction array
reaction = ":cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool::cool:"

		
module.exports = (robot) ->
	robot.respond /cool$/i, (msg) ->
		msg.send reaction
