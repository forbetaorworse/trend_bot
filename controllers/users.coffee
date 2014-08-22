Mongoose = require 'mongoose'
User = Mongoose.model 'User'

exports.signin = (req, res) ->

# Auth callback
exports.authCallBack = (req, res, next) ->
	res.redirect('/')

# Show login form
exports.login = (req, res) ->
	data =
		title: 'Login'
		message: if req.flash then req.flash 'error'
		users: User.all
	res.render 'index', data

# Show sign up form
exports.signup = (req, res) ->
	data =
		title: 'Sign up'
		user: new User
	res.render 'index', data

# Logout
exports.logout = (req, res) ->
	req.logout
	res.redirect '/login'

# Session
exports.session = (req, res) ->
	res.redirect '/'

# Create user
exports.create = (req, res) ->
	newUser = new User req.body
	newUser.provider = 'local'

	User
		.findOne { email: newUser.email }
		.exec (err, user) ->
			if err then return next err
			if !user
				newUser.save( (err) ->
					if err
						console.log err
						data =
							errors: err.errors
							user: newUser
						res.render 'users/signup', data

				)

# Show Profile
exports.show = (req, res) ->
	User
		.findOne { _id : req.params['userId'] }
		.exec (err, user) ->
			if err then return next err
			if !user then return next( new Error "Failed to load User #{id}" )

			data = 
				title: user.name
				user: user
			res.render 'users/show', data

# Find user by id
exports.user = (req, res, next, id) ->
	User
		.findOne { _id : id }
		.exec (err, user) ->
			if err then return next err
			if !user then return next( new Error "Failed to load User #{id}")
			req.profile = user
			next

