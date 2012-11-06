
#
# GET users listing.
#
models = require('../models')
User = models.User

exports.list = (req, res)->
  User.find {}, (err, docs)->
    res.render 'user/user',
      title: 'User'
      users: docs

