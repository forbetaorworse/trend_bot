# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot scrimb - return some stupid shit
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONGSPACE, you guys!!! Ha Ha drugs meaning (2014 I-H8-TRENDSPACE Edition)"

  robot.respond /(ping|assembl(e)?|call)(ing)?( all)? ((trend|gay)m'n|fag(g)?[i|e|o](t(t)?s)?)$/i, (msg) ->
    response = "Hey, listen up all you jerks. We need all trend'm assembled\n"
    for own key, user of robot.brain.data.users
      response += "ping #{user.name}\n"
    msg.send response

  robot.respond /SCRIMB$/i, (msg) ->
    msg.send "Hitler"

  
  robot.respond /bro/i, (msg) ->
    msg.send "Bro"


  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0
