mongoose = require 'mongoose'
Schema = mongoose.Schema


# User
UserSchema = new Schema
  name:
    type: String
  email:
    type: String


module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'user', UserSchema
