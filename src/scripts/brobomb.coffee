# Description:
#   Bro bomb
#
# Commands:

#
# Author:
#   Chris & Eric, TRENDSPACE INTERNET COMPANY INC

# Bro bomb
module.exports = (robot) ->
  robot.respond /bro bomb( (\d+))?/i, (msg) ->
    auth = "https://api.imgur.com/oauth2/authorize?client_id=8763f9529f7369e&response_type=token&state=poop"
    msg.http(auth)
      .get() (err, res, body) ->
        token = body
    count = msg.match[2] || 5
    if count > 20 then count = 20
    msg.http("https://api.imgur.com/3/account/richardsuit/album/jeJfW.json")
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.data
        imageArray = new Array()
        while (count -= 1)+1
          image = msg.random images
          imageArray.push "http://i.imgur.com/#{image.hash}#{image.ext}"
        msg.send image for image in imageArray