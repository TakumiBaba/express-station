
# Data expression defines here.

# DataSchema.statics.findTest = (callback) ->
# @find a, b, c, callback e, data ->

# Expression is available with...
# {Data} = app.settings.models
# Data.findTest (e, data) ->

module.exports =
  UserSchema: UserSchema
  User: mongoose.model 'user', UserSchema]
