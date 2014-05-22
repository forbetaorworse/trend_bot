mongoose = require 'mongoose'
LocalStrategy = require 'passport-local'
Thirty7SignalsStrategy = require 'passport-37signals'
User = mongoose.model 'User'

module.exports = (passport, config) ->

	# Serialize sessions
	passport.serializeUser (user, done) ->
		done null, user.id

	passport.deserializeUser (id, done) ->
		User.fineOne( [ _id: id ], (err, user) ->
			done err, user
		)

	# Local strategy
	localStrategyData =
		usernameField: 'email',
		passwordField: 'password'

	passport.use new LocalStrategy strategyData, (email, password, done) ->
		User.findOne [ email: email ], (err, user) ->
			return done err if err
			if !user then
				return done null, false, [ message: 'Unkown user']
			if !user.authenticate password then
				return done null, false, [ message: 'Invalid password']
			done null, user



	# 37Signals (Campfire) strategy - DUMMY DATA!!!! GET API ACCESS
	thirty7SignalsStrategyData =
		clientID: 'XXXXXXXXXXXXXX'
		clientSecret: 'XXXXXXXXXXXXXX'
		callbackURL: 'http://127.0.0.1:3000/auth/37signals/callback'



	passport.use new Thirty7SignalsStrategy thirty7SignalsStrategyData, (accessToken, refreshToken, profile, done) ->
		User.findOne  [ Thirty7Signals.id: profile.id, (err, user) ->
			return done err if err
			if !user then
				splitname = profile.name.split ' '
				user = new User
					firstname: splitname[0]
					lastname: splitname[1]
					email: profile.emailaddress
			done err, user
