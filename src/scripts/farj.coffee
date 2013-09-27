# Description:
#   Various dumbass scripts that probably wont work
#
# Commands:
#   hubot gron - Reply with patented GRON command
#   hubot cront - return pic of mcgibbits

yinternet = 1

module.exports = (robot) ->
  yinternet = yinternet + 1
  robot.respond /YINDY$/i, (msg) ->
    msg.send "Great work, dude! The /yindy command has been run #{yinternet} times."

module.exports = (robot) ->
  robot.respond /GRON$/i, (msg) ->
    msg.send "Thank you for running the GRON command! Copyright (C) 2013 Chris Hopkins Software. All Rights Reserved. Gifbert dude\n
getting laid in LA is awesome\n
Walk into any bar\n
order a drink\n
and then you are instantly teleported to some crazy ass house party doing coke"




  robot.respond /ALDEN$/i, (msg) ->
    grimageMe msg, "old black man", (url) ->
      msg.send url

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0


grimageMe = (msg, query, animated, cb) ->
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
              grimageMe msg, recent.messages[i-1].body, animated, cb
              return
        else msg.send "I can't find a previous message."
    else msg.send "I can't find a previous message."
    return    

  cb = animated if typeof animated == 'function'
  # if a URL is sent into grimageMe, just send it back and stop
  if query.match /^https?:\/\//i
    cb "old black man"
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


  