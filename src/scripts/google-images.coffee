# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.

module.exports = (robot) ->
  robot.respond /(image|img)( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[3], (url) ->
      msg.send url

  robot.respond /animate( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], true, (url) ->
      msg.send url

  robot.respond /(?:mo?u)?sta(?:s|c)he?(?: me)? (.*)/i, (msg) ->
    type = Math.floor(Math.random() * 3)
    mustachify = "http://mustachify.me/#{type}?src="
    imagery = msg.match[1]

    imageMe msg, imagery, (url) ->
      msg.send "#{mustachify}#{url}"

imageMe = (msg, query, animated, cb) ->
  # if query is !, find the previous message and grab its contents and rerun the query
  if query is "!"
    if msg.robot.adapter.bot.get?
      msg.robot.adapter.bot.get "/room/#{msg.message.user.room}/recent.json", (foo, recent) ->
        if recent.messages?
          i = recent.messages.length
          while i -= 1
            if recent.messages[i].id is msg.message.user.msg_id
              while recent.messages[i-1].type isnt "TextMessage"
                i--
              imageMe msg, recent.messages[i-1].body, animated, cb
              return
        else msg.send "I can't find a previous message."
    else msg.send "I can't find a previous message."
    return    

  cb = animated if typeof animated == 'function'
  # if a URL is sent into imageMe, just send it back and stop
  if query.match /^https?:\/\//i
    cb query
    return
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  if msg.message.user.room?
    if msg.message.user.room is 291291
      q.safe = 'off'
  q.as_filetype = 'gif' if typeof animated is 'boolean' and animated is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      if images.responseData? and images.responseData.results?
        images = images.responseData.results
        if images.length > 0
          image  = msg.random images
          cb "#{image.unescapedUrl}#.png"
        else
          msg.send "I can't find any images like that."
      else
        msg.send "Does not compute."
        console.log "Image me fail."
        console.log images

