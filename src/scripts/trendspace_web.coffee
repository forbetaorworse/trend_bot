# Description:
# 	This is the main web config for TRENDSPACE
#	All routes and configs required
#	to power the site & app belong here
#
# Author:
#	Eric M.F. Westbrook
#


passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
Thirty7SignalsStrategy = require('passport-37signals').Strategy
User = require '../user'
mongoose = require 'mongoose'
fs = require 'fs'

THIRTY7SIGNALS_CLIENT_ID = '1234'
THIRTY7SIGNALS_CLIENT_SECRET = '5678'

####################################
############# Database #############
####################################

user = process.env.MONGOHQ_USERNAME || "admin"
pass = process.env.MONGOHQ_PASSWORD || "password"
port = process.env.MONGOHQ_PORT || "27017"
dbname = process.env.MONGOHQ_DB || "hubot"
host = process.env.MONGOHQ_URL || "mongodb://#{user}:#{pass}@localhost:#{port}/#{dbname}"

mongoose.connect host
db = mongoose.connection

db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', connected = ()->
	console.log 'Mongoose connected to mongo'

########### End Database ###########

####################################
########## Import Models ###########
####################################

models_path = __dirname + '/../../models'
for file in fs.readdirSync(models_path)
	require "#{models_path}/#{file}"

######## END Import Models #########





####################################
##### Authorization Strategies #####
####################################

passport.use(new LocalStrategy({
		usernameField: 'email',
		passwordField: 'password'
	},
	(email, password, done) ->
		User.findOne(
			{ email: email },
			returnFunction = (err, user) ->
				if err
					return done(err)
				if !user
					return done(null, false, { meddage: 'Unkown user' })
				if !user.authenticate(password)
					return done(null, false, { message: 'Invalid password' })
				return done(null, user)
		)
	)
)

passport.use(new Thirty7SignalsStrategy({
		clientID: THIRTY7SIGNALS_CLIENT_ID,
		clientSecret: THIRTY7SIGNALS_CLIENT_SECRET ,
		callbackURL: "http://ihatetrendspace.com/auth/37signals/callback",
	},
	(accessToken, refreshToken, profile, done) ->
		User.findOrCreate({ thirty7signalsId: profile.id }, (err, user) ->
			return done err, user
		)
	)
)

### End Authorization Strategies ###

module.exports = (@robot) ->
	####################################
	########## Import Routes ###########
	####################################

	require(__dirname + '/../../config/routes')(@robot.router, passport)

	######## END Import Routes #########

