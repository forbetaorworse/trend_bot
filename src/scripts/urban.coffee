# Description:
#   Define terms via Urban Dictionary
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what is <term>?         - Searches Urban Dictionary and returns definition
#   hubot define <term>  - Searches Urban Dictionary and returns definition 
#
# Author:
#   Travis Jeffery (@travisjeffery)
#   Robbie Trencheny (@Robbie)
#
# Contributors:
#   Benjamin Eidelman (@beneidel)

module.exports = (robot) ->

  robot.respond /(define|what ?is) (.+)*/i, (msg) ->
    urbanDict msg, msg.match[2], (found, entry, sounds) ->
      if !found
        msg.send "\"#{msg.match[2]}\" not found"
        return
      else
        msg.send "#{msg.match[2]} : #{entry.definition}"
      if sounds and sounds.length
        msg.send "Audio examples: \n#{sounds.join(' ')}"

urbanDict = (msg, query, callback) ->
  msg.http("http://api.urbandictionary.com/v0/define?term=#{escape(query)}")
    .get() (err, res, body) ->
      result = JSON.parse(body)
      if result.list.length
        callback(true, result.list[0], result.sounds)
      else
        callback(false)
