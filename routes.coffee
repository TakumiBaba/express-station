
exports.setup = (app)->
  controllers = {}
  require("fs").readdirSync("./controllers/").forEach((file)->
    controllers[file.replace(/\.coffee$/, '')] = require("./controllers/#{file}")
  )
  
  app.get '/', controllers["index"].index
  app.get '/users', controllers["user"].list
