# Description:
#   Various dumbass scripts that probably wont work
#
# Commands:
#   hubot gron - Reply with patented GRON command
#   hubot diet - End hubot process

module.exports = (robot) ->
  robot.respond /GRON$/i, (msg) ->
    msg.send "Thank you for running the GRON command! Copyright (C) 2013 Chris Hopkins Software. All Rights Reserved. Gifbert dude\n
getting laid in LA is awesome\n
Walk into any bar\n
order a drink\n
and then you are instantly teleported to some crazy ass house party doing coke"

  robot.respond /DIET$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0
