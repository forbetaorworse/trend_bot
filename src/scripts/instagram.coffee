# Description:
#   Gets different things from instagram
#
# Commands:
#   hubot westbrook bomb N - Posts N pics westbrook is tagged in
#
# Dependencies:
#   "instagram-node-lib" : ">=0.1.1"
#
# Configuration:
#   HUBOT_INSTAGRAM_CLIENT_KEY
#   HUBOT_INSTAGRAM_CLIENT_SECRET
#
# Author:
#   Eric Westbrook
#

config =
  client_key: process.env.HUBOT_INSTAGRAM_CLIENT_KEY
  client_secret: process.env.HUBOT_INSTAGRAM_CLIENT_SECRET
  redirect_uri: "/instagramredirect"
  heroku_url : process.env.HEROKU_URL

unless config.client_key
  console.log "Please set the HUBOT_INSTAGRAM_CLIENT_KEY environment variable."
unless config.client_secret
  console.log "Please set the HUBOT_INSTAGRAM_CLIENT_SECRET environment variable."

accounts = 
  westbrook :
    details :
      theCode : "9326369c86fa457fb8c5734d1c39ac0a"
      username : "ericwestbrook"

account = ""
user_access_token = ""

Instagram = require "instagram-node-lib"
url = require "url"

Instagram.set(
  client_id : config.client_key
  client_secret : config.client_secret
  redirect_uri : "#config.heroku_url}#{config.redirect_uri}"
)

# Westbrook Bomb
module.exports = (robot) ->
  robot.respond /(westbrook|westeros|jewest|westie) bomb( (\d+))?/i, (msg) ->
    account = "westbrook"
    count = msg.match[1]
    feedBomb(count, msg)

  robot.router.get config.redirect_uri, (req, res) ->
    console.log("TERRIBLE LIE!")
    Instagram.subscriptions.handshake req, res    

  robot.router.get '/hubot/feedbomb', (req, res) ->
    Instagram.oauth.ask_for_access_token {
      grant_type: 'authorization_code',
      code: accounts[account].details.theCode,
      request: req,
      response: res,
      complete: (access, response) ->
        user_acces_token = access['access_token']
        response.writeHead(200, {'Content-Type': 'text/plain'})
        response.end "McWOOOOOORLD"
      error: (errorMessage, errorObject, caller, response) ->
        console.log("Error on #{errorObject}: #{errorMessage}")
        response.end "McNope"
    }
    return null
  robot.listen

feedBomb = (count, msg) ->
  count = count || 5
  if count > 20 then count = 20
  msg.http("#{config.heroku_url}/hubot/feedbomb")
    .get() (error, res, body) ->
      Instagram.set('access_token', user_access_token)
      console.log(res)
      console.log("Here's the access token: #{user_access_token}")
      results = Instagram.users.self(
        complete : (data) ->
          for result in media
            if count > 0
              msg.send media.data.images.standard_resolution
            else
              msg.send "no results"
      )
 
completion = (params, response) -> 
  console.log("There we go!")
  user_acces_token = params['access_token']
  response.writeHead(200, {'Content-Type': 'text/plain'})
  response.end "MCWOOOOOORLD"