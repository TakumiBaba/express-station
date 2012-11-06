mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

# Tweet
TweetSchema = new Schema
  content:
    type: String
  user:
    type: ObjectId
  created_at:
    type: Date
    default: (new Date()).getTime()

# User
UserSchema = new Schema
  name:
    type: String
  created_at:
    type: Date
    default: (new Date()).getTime()

module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'user', UserSchema
  TweetSchema: TweetSchema
  Tweet: mongoose.model 'tweet', TweetSchema
