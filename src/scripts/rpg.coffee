# rpg.coffee
#
# Description:
#   A Journey of Enchantence - To The Inner Depths of Gremdar
#
# Commands:
#   hubot rpg - Returns a rpg.

module.exports = (robot) ->
	robot.respond /rpg$/i, (msg) ->

		rpg_name = "#{msg.message.user.name}"
		msg.send "--== Welcome to the Adventure, #{rpg_name} ==--"
		#msg.send "#{msg.message.user.name}"