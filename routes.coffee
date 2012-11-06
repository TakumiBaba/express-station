
exports.setup = (app)->
  controllers = {}
  require("fs").readdirSync("./controllers/").forEach((file)->
    controllers[file.replace(/\.coffee$/, '')] = require("./controllers/#{file}")
  )
  
  app.get '/', controllers["index"].index
  app.get '/tweets.json', controllers["tweet"].list.json
  app.get '/users', controllers["user"].list
