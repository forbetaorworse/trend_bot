# Description:
#  Enhances hubot-brain with MongoDB. Useful for Heroku accounts that want
#  better persistance. Falls back to memory brain if Mongo connection fails
#  for local testing.
#
# Dependencies:
#   "mongodb": ">= 1.2.0"
#
# Configuration:
#   MONGODB_USERNAME
#   MONGODB_PASSWORD
#   MONGODB_HOST
#   MONGODB_PORT
#   MONGODB_DB
#
# Commands:
#   None
#
# Author:
#   ajacksified, maxbeatty

Util = require "util"
mongodb = require "mongodb"
Server = mongodb.Server
Collection = mongodb.Collection
Db = mongodb.Db
url = require 'url'

module.exports = (robot) ->
  user = process.env.MONGOHQ_USERNAME || "admin"
  pass = process.env.MONGOHQ_PASSWORD || "password"
  port = process.env.MONGOHQ_PORT || "27017"
  dbname = process.env.MONGOHQ_DB || "hubot"
  host = process.env.MONGOHQ_URL || "mongodb://#{user}:#{pass}@localhost:#{port}/#{dbname}"

  connection_uri = url.parse(host)
  if host != 'mongodb://#{user}:#{pass}@localhost:#{port}/#{dbname}'
    dbname = connection_uri.pathname.replace(/^\//, '')


  error = (err) ->
    console.log "==MONGO BRAIN UNAVAILABLE==\n==SWITCHING TO MEMORY BRAIN=="
    console.log err


  Db.connect host, (err, client)->
    return error err if err
    robot.logger.debug "We've connected!"

    collection = new Collection client, 'hubot_storage'
    collection.find().limit(1).toArray (err, results) ->
      return error err if err

      robot.logger.debug 'Successfully queried mongo'
      robot.logger.debug Util.inspect(results, false, 4)

      if results.length > 0
        robot.brain.data = results[0]
        robot.brain.emit 'loaded', results[0]
      else
        robot.logger.debug 'No results found'

    robot.brain.on 'save', (data) ->
      robot.logger.debug 'Save event caught by mongo'
      robot.logger.debug Util.inspect(robot.brain.data, false, 4)

      collection.save robot.brain.data, (err) ->
        console.warn err if err?
        