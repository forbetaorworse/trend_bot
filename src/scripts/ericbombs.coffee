# Description:
#   Get it, sucka
#
# Commands:
#   hubot cringe bomb N - get N cringe pics
#   hubot dogecoin bomb N - get N dogecoin pics
#   hubot god bomb N - get N onetruegod pics
#   hubot idiot bomb N - get N idiotsfightingthings pics

#
# Author:
#   Eric Westbrook



# Cringe bomb
module.exports = (robot) ->
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
module.exports = (robot) ->
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

# God bomb
module.exports = (robot) ->
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
module.exports = (robot) ->
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
