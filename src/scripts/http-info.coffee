# Description:
#   Returns title and description when links are posted
#
# Dependencies:
#   "jsdom": "0.2.15"
#
# Configuration:
#   None
#
# Commands:
#   http(s)://<site> - prints the title and meta description for sites linked.
#
# Authors:
#   ajacksified

jsdom = require('jsdom')

module.exports = (robot) ->

  robot.hear /http(s?):\/\/(.*)/i, (msg) ->
    url = msg.match[0]

    # filter out some common files and URLs from trying
    unless url.match(/\.(png|jpg|jpeg|gif|txt|zip|tar\.bz|js|css)/) or url.match(/(facebook|lmgtfy|autotask|yeti)/)
      jsdom.env(
        html: msg.match[0]
        scripts: [
          'http://code.jquery.com/jquery-1.7.2.min.js'
        ]
        done: (errors, window) ->
          unless errors
            $ = window.$
            title = $('title').text()
			
			# filter out some jokes for pleasure
            unless /Let me google that for you/.test(title)
              description = $('meta[name=description]').attr("content") || ""
              description = "\n" + description if description
            
              if title and title isnt description
                msg.send "#{title}#{description}"
              else if title
                msg.snd "#{title}"
        )
