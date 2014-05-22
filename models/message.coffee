# Model dependencies
Mongoose = require 'mongoose'
Schema = Mongoose.Schema
ObjectId = Mongoose.Schema.Types.ObjectId

# Message Schema
MessageSchema = new Schema(
	date: Date
	sender: ObjectId
	receiver: ObjectId
	channels: [ObjectId]
	content: String
	parent: Schema.Types.ObjectId
	upScorers: [ObjectId]
	downScorers: [ObjectId]
	nsfwers: [ObjectId]
)

# TODO Validations

# Pre-save hook
MessageSchema.pre('save', (next) ->
	@sender.save
)

# Methods
MessageSchema.methods = 
	upScore: (user)->
		upScorer.addToSet user
		if @sender then @sender.upScore
	downScore: (user)->
		downScorer.addToSet user
		if @senser then @sender.downScore


Mongoose.model 'Message', MessageSchema