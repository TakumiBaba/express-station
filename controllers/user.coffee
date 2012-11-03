
#
# GET users listing.
#

exports.list = (req, res)->
  res.render 'user/user', {title: 'User'}
