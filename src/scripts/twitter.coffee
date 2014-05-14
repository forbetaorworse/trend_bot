# Description:
#   gets tweet from user
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot twitter <twitter username> - Show last tweet from <twitter username>
#   hubot tweet <update> - posts the update to twitter
#
# Author:
#   Eric Westbrook
#

Twit = require "twit"
config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  accounts_json: process.env.HUBOT_TWEETER_ACCOUNTS

unless config.consumer_key
  console.log "Please set the HUBOT_TWITTER_CONSUMER_KEY environment variable."
unless config.consumer_secret
  console.log "Please set the HUBOT_TWITTER_CONSUMER_SECRET environment variable."
unless config.accounts_json
  console.log "Please set the HUBOT_TWEETER_ACCOUNTS environment variable."

config.accounts = JSON.parse(config.accounts_json || "{}")




module.exports = (robot) ->
  robot.respond /(twitter|lasttweet) (.+)$/i, (msg) ->
   username = msg.match[2]
   msg.http("http://api.twitter.com/1/statuses/user_timeline/#{escape(username)}.json?count=1&include_rts=true")
    .get() (err, res, body) ->
      response = JSON.parse body
      if response[0]
       msg.send response[0]["text"]
      else
       msg.send "Error"


module.exports = (robot) ->
  robot.respond /tweet( )?$/i, (msg) ->
    msg.reply "You need to actually say something, dipshit."
    return

  robot.respond /tweet (.+)*$/i, (msg) ->
    username = "ihatetrendspace"
    update   = msg.match[1].trim()
    unless config.accounts[username]
      msg.reply "I'm not setup to send tweets on behalf of #{username}. Sorry."
      return
    unless update and update.length > 0
      msg.reply "You need to actually say something, dipshit."
      return

    twit = new Twit
      consumer_key: config.consumer_key
      consumer_secret: config.consumer_secret
      access_token: config.accounts[username].access_token
      access_token_secret: config.accounts[username].access_token_secret

    twit.post "statuses/update",
      status: update
    , (err, reply) ->
      if err
        data = JSON.parse(err.data).errors[0]
        msg.reply "I can't do that. #{data.message} (error #{data.code})"
        return
      if reply['text']
        return msg.send "#{reply['user']['screen_name']} just tweeted: #{reply['text']}"
      else
        return msg.reply "Hmmm.. I'm not sure if the tweet posted. Check the account: http://twitter.com/#{username}"
