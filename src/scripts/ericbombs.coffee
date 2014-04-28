# Description:
#   Get it, sucka
#
# Commands:
#   hubot actual bomb N - get N explosion pics
#   hubot brony bomb N - get N brony pics
#   hubot cringe bomb N - get N cringe pics
#   hubot dogecoin bomb N - get N dogecoin pics
#   hubot god bomb N - get N onetruegod pics
#   hubot idiot bomb N - get N idiotsfightingthings pics
#   hubot woah bomb N - get N woahdude pics
#   hubot yummy bomb N - get N shittyfoodporn pics

#
# Author:
#   Eric Westbrook

module.exports = (robot) ->
  # Actual bomb
  robot.respond /actual bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/bombs.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Brony bomb
  robot.respond /brony bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/clopclop.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Cringe bomb
  robot.respond /cringe bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/cringepics.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Dogecoin bomb
  robot.respond /dogecoin bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/dogecoin.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray
        msg.send "Fuck You"

  # God bomb
  robot.respond /god bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/onetruegod.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Idiot bomb
  robot.respond /idiot bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/idiotsfightingthings.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Woah bomb
  robot.respond /woah bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/woahdude.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray

  # Yummy bomb
  robot.respond /yummy bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/shittyfoodporn.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray
