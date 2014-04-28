# Description:
#   Get it, sucka
#
# Commands:
#   hubot cringe bomb N - get N cringe pics
#   hubot idiot bomb N - get N idiotsfightingthings pics
#   hubot honky bomb N - get N whitepeoplegifs pics

#
# Author:
#   Eric Westbrook



# Dick bomb
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

# Honky bomb
module.exports = (robot) ->
  robot.respond /honky bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("http://imgur.com/r/whitepeoplegifs.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray