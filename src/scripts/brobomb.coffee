# Description:
#   Bro bomb
#
# Commands:
#   hubot dick bomb N - get N dicks
#   hubot tit bomb N - get N tits
#   hubot porn bomb N - get N porns
#
# Author:
#   Chris & Eric, TRENDSPACE INTERNET COMPANY INC



# Dick bomb
module.exports = (robot) ->
  robot.respond /dick bomb( (\d+))?/i, (msg) ->
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