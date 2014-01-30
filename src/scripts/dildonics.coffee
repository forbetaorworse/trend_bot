# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Raises current level of fagocity
#   hubot dedildonics - Lowers current level of fagocity

fagocity = 1

module.exports = (robot) ->
  robot.respond /dildonics$/i, (msg) ->
    msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."
    fagocity = fagocity + 1


  robot.respond /dedildonics$/i, (msg) ->
  	fagocity = fagocity - 1
    msg.send "Notice. Current level of fagocity in TRENDSPACE has now stabalized to #{fagocity}."
