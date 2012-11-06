
#
# GET home page.
#

models = require('../models')
Tweet = models.Tweet

exports.index = (req, res)->
  res.render 'index', {title: 'Express', greedings: 'Hello!'}
  