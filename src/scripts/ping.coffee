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
    msg.send "PONGSPACE, you guys!!! Ha Ha drugs meaning"

  robot.respond /SCRIMB$/i, (msg) ->
    msg.send "Hitler"

  robot.respond /YINDY$/i, (msg) ->
    if yinternet < 10
    	yinternet = 1
    else
    	yinternet++
    msg.send "Great work, dude! The /yindy command has been run yinternet times."
  

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0

