# Description:
#   The TRENDSPACE Instagram integration
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
#   Eric Motherfucking Westbrook
#

config =
  client_key: process.env.HUBOT_INSTAGRAM_CLIENT_KEY || "ccdd113f05264f22b580f142404da50b"
  client_secret: process.env.HUBOT_INSTAGRAM_CLIENT_SECRET || "9bbd7d9dcf6c4aab9d0ed00785fc30bc"
  redirect_uri: "/instagramredirect"
  heroku_url : process.env.HEROKU_URL || "http://local.t-r-e-n-d-s-p-a-c-e.com"
  account : ""
  user_access_token : ""

unless config.client_key != "ccdd113f05264f22b580f142404da50b"
  console.log "Loading Instagram staging environment. Please set the HUBOT_INSTAGRAM_CLIENT_KEY environment variable."

Instagram = require "instagram-node-lib"
url = require "url"

Instagram.set(
  client_id : config.client_key
  client_secret : config.client_secret
  redirect_uri : "#config.heroku_url}#{config.redirect_uri}"
)

# Westbrook Bomb
module.exports = (robot) ->
  # GET STORED ACCOUNTS FROM MONGO IF PRESENT
  accounts = []
  robot.brain.on 'loaded', ->
    if robot.brain.data.accounts?
      accounts = robot.data.accounts
    else
      accounts = 
        westbrook :
          details :
            theCode : "9326369c86fa457fb8c5734d1c39ac0a"
            username : "ericwestbrook"


  robot.respond /(westbrook|westeros|jewest|westie) bomb( (\d+))?/i, (msg) ->
    config.account = "westbrook"
    count = msg.match[1]
    feedBomb(count, msg)

  # INSTAGRAM AUTH REDIRECT
  robot.router.get config.redirect_uri, (req, res) ->
    Instagram.subscriptions.handshake req, res    


  # GET FEED BOMB
  robot.router.get '/hubot/feedbomb', (request, response) ->
    Instagram.oauth.ask_for_access_token {
      grant_type: 'authorization_code',
      code: accounts[config.account].details.theCode,
      request: request,
      response: response,
      complete: (access, response) -> 
        config.user_access_token = access['access_token']
        response.writeHead(200, {'Content-Type': 'text/plain'})
        response.end "McWOOOOOORLD"
        console.log("aww yiss")
      error: (errorMessage, errorObject, caller, response) ->
        console.log("Error on #{errorObject}: #{errorMessage}")
        response.end "McNope"
    }

feedBomb = (count, msg) ->
  count = count || 5
  if count > 20 then count = 20
  msg.http("#{config.heroku_url}/hubot/feedbomb")
    .get() (error, res, body) ->
      Instagram.set('access_token', config.user_access_token)
      console.log(res)
      console.log("Here's the access token: #{config.user_access_token}")
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
  config.user_acces_token = params['access_token']
  response.writeHead(200, {'Content-Type': 'text/plain'})
  response.end "MCWOOOOOORLD"