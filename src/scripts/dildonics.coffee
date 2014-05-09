# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Raises current level of fagocity
#   hubot dedildonics - Lowers current level of fagocity

module.exports = (robot) ->
	fagocity = 0
	user_fagocities = []
	robot.brain.on 'loaded', ->
		if robot.brain.data.fagocity?
			fagocity = robot.brain.data.fagocity
		else fagocity = 1
		console.log("Current level of fagocity: #{fagocity}")
		if robot.brain.data.user_fagocities?
			user_fagocities = robot.brain.data.user_fagocities
		robot.brain.data.user_fagocities = user_fagocities






	robot.respond /fagocity stats( ([\w.-]*))?$/i, (msg) ->
		username = msg.match[1]
		addUsersToFagocity(robot)
		response = "Fagocity User Stats\n"
		for user in user_fagocities
			if user
				response += "#{user.name} has a fagocity of #{user.score}\n"
		msg.send response






	robot.respond /fagocity down (.*)$/i, (msg) ->
		addUsersToFagocity(robot)
		username = msg.match[1]
		userId = robot.brain.userForName username
		if userId.id
			user_fagocities[userId.id].score -= 1
			robot.brain.data.user_fagocities = user_fagocities
			msg.send "#{msg.message.user.name} lowered #{username}'s fagocity level by 1 point to #{user_fagocities[userId.id].score}"
		else
			msg.send "User #{username} does not exist"







	robot.respond /fagocity up (.*)$/i, (msg) ->
		addUsersToFagocity(robot)
		username = msg.match[1]
		userId = robot.brain.userForName username
		if userId.id
			user_fagocities[userId.id].score += 1
			robot.brain.data.user_fagocities = user_fagocities
			msg.send "#{msg.message.user.name} raised #{username}'s fagocity level by 1 point to #{user_fagocities[userId.id].score}"
		else
			msg.send "User #{username} does not exist"





	robot.respond /(dildonics|fagocity(?!( ?-)))( (\d+))?$/i, (msg) ->
		if msg.match[3]
			fagocity += Number(msg.match[3])
		else
			fagocity += 1
		robot.brain.data.fagocity = fagocity
		msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."






	robot.respond /(dedildonics|fagocity( )?-)( ?(\d+))?$/i, (msg) ->
		if msg.match[4]
			fagocity -= Number(msg.match[4])
		else if msg.match[3]
			fagocity -= Number(msg.match[3])
		else
			fagocity -= 1
		robot.brain.data.fagocity = fagocity
		msg.send "Notice. Current level of fagocity in TRENDSPACE has been lowered to #{fagocity}."






	robot.respond /dildonics reset/i, (msg) ->
		fagocity = 0
		robot.brain.data.fagocity = fagocity
		msg.send "Fagocity has been reset back to zero. We are safe now."
	




	
	addUsersToFagocity = (@robot)->
		for userId, user of @robot.brain.data.users
			if @robot.brain.data.user_fagocities[userId] && user.id && userId?
				user_fagocities[userId].name = user.name
				@robot.brain.data.user_fagocities[userId].name = user.name
			else if userId
				fagocity_user = user
				fagocity_user.score = 0
				user_fagocities[userId] = fagocity_user
				@robot.brain.data.user_fagocities = user_fagocities

