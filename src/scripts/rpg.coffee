# rpg.coffee
#
# Description:
#   A Journey of Enchantence - To The Inner Depths of Gremdar
#
# Commands:
#   hubot rpg - Returns a rpg.

module.exports = (robot) ->
	robot.respond /rpg$/i, (msg) ->
		msg.send "RPG script run B"
		msg.send "#{msg.message.user.name}"