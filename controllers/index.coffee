
exports.index = (req, res)->
  res.render 'index', {title: 'Express', greedings: 'Hello!'}
  