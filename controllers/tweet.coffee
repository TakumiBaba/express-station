
models = require('../models')
Tweet = models.Tweet
exports.list =
  json: (req, res)->
    Tweet.find().limit(10).populate('user').sort('-created_at').exec (error, docs)->
      unless error
        res.send JSON.stringify(docs)
      else
        console.warn error
        console.error 'error occured'.
        res.send "something went wrong."
