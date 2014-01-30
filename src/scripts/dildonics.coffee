# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot dildonics - Replies with current level of fagocity

fagocity = 1

module.exports = (robot) ->
  robot.respond /dildonics$/i, (msg) ->
    msg.send "Warning! Current level of fagocity in TRENDSPACE is now #{fagocity}."
    fagocity = fagocity + 1