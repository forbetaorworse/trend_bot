# Module dependencies
Mongoose = require 'mongoose'
Schema = Mongoose.Schema
Crypto = require 'crypto'
_ = require 'underscore'
AuthTypes = ['37signals']
ObjectId = Mongoose.Schema.Types.ObjectId


# User Schema
UserSchema = new Schema(
	firstname: String
	lastname: String
	email: String
	username: String
	provider: String
	score: Number
	hashed_password: String
	salt: String
	Thirty7Signals: {}
)



# Virtuals
UserSchema.virtual 'password'
UserSchema.set (password) ->
	@_password = password
	@salt = @makeSalt
	@hashed_password = @encryptPassword(password)
UserSchema.get () ->
		@_password



# Validations
validatePresenceOf = (value) ->
	value && value.length

# The below 5 validations only apply if you are signing up traditionally
UserSchema.path('firstname').validate( (firstname) ->
	if authTypes.indexOf @provider != -1 then true
	else firstname.length
, 'Name cannot be blank')

UserSchema.path('lastname').validate( (firstname) ->
	if authTypes.indexOf @provider != -1 then true
	else lastname.length
, 'Name cannot be blank')

UserSchema.path('email').validate( (email) ->
	if authTypes.indexOf @provider != -1 then true
	else email.length
, 'Email cannot be blank')

UserSchema.path('username').validate( (username) ->
	if authTypes.indexOf @provider != -1 then true
	else username.length
, 'Username cannot be blank')

UserSchema.path('hashed_password').validate( (hashed_password) ->
	if authTypes.indexOf @provider != -1 then true
	else hashed_password.length
, 'Password cannot be blank')


# Pre-save hook
UserSchema.pre('save', (next) ->
	if !@isNew then next
	if !validatePresenceOf @password && authTypes.indesOf @provider == -1
		next new Error 'Invalid password'
)

# Methods
UserSchema.methods =
	authenticate: (plainText) ->
		@encryptPassword plainText == @hashed_password
	makeSalt: () ->
		"#{ Math.round((new Date.valueOf * Math.random)) }"
	encryptPassword: (password) ->
		if !password then ""
		else Crypto.createHmac('sha1', @salt).update(password).digest('hex')
	upScore: () ->
		@score += 1
	downScore: () ->
		@score -= 1

Mongoose.model 'User', UserSchema
