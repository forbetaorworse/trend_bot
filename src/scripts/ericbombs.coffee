# Description:
#   Get it, sucka
#
# Commands:
#   hubot actual bomb N - get N explosion pics
#   hubot advice bomb N - get N advice animals pics
#   hubot brony bomb N - get N brony pics
#   hubot cringe bomb N - get N cringe pics
#   hubot dick bomb N - get N dick pics
#   hubot dogecoin bomb N - get N dogecoin pics
#   hubot god bomb N - get N onetruegod pics
#   hubot idiot bomb N - get N idiotsfightingthings pics
#   hubot nature bomb N - get N animalsbeingjerks pics
#   hubot nope bomb N - get N nope pics
#   hubot porn bomb N - get N porn pics
#   hubot reaction bomb N - get N chemicalreactiongifs pics
#   hubot soda bomb N - get N where'd the soda go pics
#   hubot tit bomb N - get N tit pics
#   hubot trendspace bomb N - get N trendspace pics
#   hubot woah bomb N - get N woahdude pics
#   hubot yummy bomb N - get N shittyfoodporn pics
#   hubot custom SUBREDDIT bomb N - get N pics from any subreddit you want
#   hubot x - Panic button

#
# Author:
#   Eric Westbrook

module.exports = (robot) ->
  # Actual bomb
  robot.respond /actual bomb( (\d+))?/i, (msg) ->
    bombMe("bombs", msg)

  # Advice bomb
  robot.respond /advice bomb( (\d+))?/i, (msg) ->
    bombMe("adviceanimals", msg)

  # Brony bomb
  robot.respond /brony bomb( (\d+))?/i, (msg) ->
    bombMe("clopclop", msg)

  # Cringe bomb
  robot.respond /cringe bomb( (\d+))?/i, (msg) ->
    bombMe("cringepics", msg)

  # Dick bomb
  robot.respond /dick bomb( (\d+))?/i, (msg) ->
    bombMe("penis", msg)

  # Dogecoin bomb
  robot.respond /dogecoin bomb( (\d+))?/i, (msg) ->
    bombMe("dogecoin", msg)

  # God bomb
  robot.respond /god bomb( (\d+))?/i, (msg) ->
    bombMe("onetruegod", msg)

  # Idiot bomb
  robot.respond /idiot bomb( (\d+))?/i, (msg) ->
    bombMe("idiotsfightingthings", msg)

  # Nature bomb
  robot.respond /nature bomb( (\d+))?/i, (msg) ->
    bombMe("animalsbeingjerks", msg)

  # Nope bomb
  robot.respond /nope bomb( (\d+))?/i, (msg) ->
    bombMe("nope", msg)

  # Porn bomb
  robot.respond /porn bomb( (\d+))?/i, (msg) ->
    bombMe("porn", msg)

  # Reaction bomb
  robot.respond /reaction bomb( (\d+))?/i, (msg) ->
    bombMe("chemicalreactiongifs", msg)

  #Soda bomb
  robot.respond /soda bomb( (\d+))?/i, (msg) ->
    bombMe("wheredidthesodago", msg)

  # Tit bomb
  robot.respond /tit bomb( (\d+))?/i, (msg) ->
    bombMe("tits", msg)

  # Tredndspace bomb
  robot.respond /(trendspace|ts) bomb( (\d+))?/i, (msg) ->
    bombMe("trendspace", msg)

  # Woah bomb
  robot.respond /woah bomb( (\d+))?/i, (msg) ->
    bombMe("woahdude", msg)

  # WTF bomb
  robot.respond /wtf bomb( (\d+))?/i, (msg) ->
    bombMe("wtf", msg)

  # Wrong bomb
  robot.respond /wrong bomb( (\d+))?/i, (msg) ->
    bombMe("whatcouldgowrong", msg)

  # Yummy bomb
  robot.respond /yummy bomb( (\d+))?/i, (msg) ->
    bombMe("shittyfoodporn", msg)

  # Custom subreddit bomb
  robot.respond /custom ([\w.-]*) bomb( (\d+))?/i, (msg) ->
    subreddit = msg.match[1]
    fuckyou =/(i?)(gore|spacedicks)/i.test subreddit
    if fuckyou
      subreddit = "aww"
      msg.send "Fuck you, I'm not doing it..."
    bombMe(subreddit, msg)

  # Nope
  robot.respond /x/i, (msg) ->
    for [0..40]
      msg.send "x"

  #Bomb list
  robot.respond /bomb list/i, (msg) ->
    cmds = robot.helpCommands()
    cmds = cmds.filter (cmd) ->
      cmd.match new RegExp("bomb", 'i')
    emit = cmds.join "\n"
    unless robot.name.toLowerCase() is 'hubot'
      emit = emit.replace /hubot/ig, robot.name
    msg.send emit

bombMe = (subreddit, msg) ->
  count = msg.match[2] || 5
  if count > 20 then count = 20
  msg.http("http://imgur.com/r/#{subreddit}.json")
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.data
      imageArray = new Array()
      while (count -= 1)+1
        image = msg.random images
        imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
      msg.send image for image in imageArray