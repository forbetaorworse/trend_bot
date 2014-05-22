# Module dependencies
Mongoose = require 'mongoose'
Schema = Mongoose.Schema
ObjectId = Mongoose.Schema.Types.ObjectId

#Channel Schema
ChannelSchema = new Schema(
	name: String
	creator: ObjectId
	members: [ObjectId]
)

# TODO Validations

# TODO Methods


Mongoose.model 'Channel', ChannelSchema