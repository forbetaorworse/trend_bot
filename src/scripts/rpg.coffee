# rpg.coffee
#
# Description:
#   A Journey of Enchantence - To The Inner Depths of Gremdar
#
# Commands:
#   hubot rpg - Returns a rpg.

globvar = 169
rpg_hp = 377

module.exports = (robot) ->
	robot.respond /rpg$/i, (msg) ->
		rpg_name = "#{msg.message.user.name}"
		msg.send "--== Welcome to the Adventure, #{rpg_name} ==--"," ","Your HP: #{rpg_hp}","Your MP: 7"," ","Location: Mossy Cavern"
		msg.send " "
		#msg.send "Your HP: #{rpg_hp}"

	robot.respond /rpg2$/i, (msg) ->
		rpg_hp -= 2
		msg.send "Decreasing your HP by 2. Your HP is now: #{rpg_hp}"


	robot.respond /rpg3$/i, (msg) ->
		rpg_name = "#{msg.message.user.name}"
		if rpg_name is "Shell"
			msg.send "Your loco and rpg_name is #{rpg_name}"
		else
			msg.send "I don't know who yer face belongs to, stranger."
		msg.send "--==(0)==--"
