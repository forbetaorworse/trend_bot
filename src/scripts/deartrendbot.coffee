# Description:
#   Ask trendbot for advice
#
# Commands:
#   hubot dear trendbot [Your question] - Get trendbot's expert advice on anything

#
# Author:
#   Eric Westbrook

drugs = [
  "foxy"
  "blow"
  "weed"
  "ecstacy"
  "shrooms"
  "acid"
  "whipits"
  "phen phen"
  "MDMA"
  "molly"
  "alcohol"
  "random pills I found in a dumpster outside of trannyshack"
]

responses = [
  "You should definitely do more 123 and think about it."
  "Ask me again later. I'm too fucked up on 123."
  "Fuck you, that's what I think. Just kidding, have some 123."
  "That's a bad idea. You should do more 123 instead."
  "You'd be better off selling 123 to kids."
  "I don't know, now help me get my 123 back from that hooker."
  "Give me some of that 123 and I'll tell you."
  "That's almost as good as this 123."
  "Maybe you should stop being a faggot and do more 123."
]

module.exports = (robot) ->
  robot.respond /dear (trendbot|trendspace|ts|faggots) .*/i, (msg) ->
    question = msg.match[2]
    drug = drugs[Math.floor(Math.random() * reaction.length)]
    response = responses[Math.floor(Math.random() * reaction.length)].replace /123/ drug
    msg.send response
    