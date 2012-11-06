mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

# Tweet
TweetSchema = new Schema
  message:
    type: String
  user:
    type: ObjectId
    ref: 'User'
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

UserSchema.statics.findOrCreateByName = (name, callback)->
  this.findOne('name': name, 'name created_at', (error, docs) =>
    user = docs
    unless user
      user = this('name': name)
      user.save()
    callback(error, user)
  )

module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'User', UserSchema
  TweetSchema: TweetSchema
  Tweet: mongoose.model 'Tweet', TweetSchema
