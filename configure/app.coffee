
#
# Module dependencies.
#

# Include modules
express = require('express')
mongoose = require 'mongoose'
http = require('http')
path = require('path')
assets = require('connect-assets')()
config = require('./config.json');

# Define express application
app = express()

# Configure Application settings.
app.configure ()->
  # Set port number
  app.set 'port', process.env.PORT || 3000
  # Set view environment
  app.set 'views', path.join(__dirname, '../views')
  app.set 'view engine', 'jade'
  # Include user configurations
  app.set k, v for k, v of config
  # some settings...
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, '../public'))
  app.use assets

# Configure environment for Development
app.configure 'development', ()->
  app.use express.errorHandler()
  app.locals.pretty = true

# Connect to Mongo DB
mongoose.connect app.settings.dbpath, (error) ->
  if error
    console.warn error
    console.error "failed on connecting #{app.settings.dbpath}"
  else
    console.info "MongoDB connected."

# Include routes defines.
require('../routes').setup(app)

# Start HTTP server
http.createServer(app).listen(app.get('port'), ()->
  console.log "Express server listening on port #{app.get('port')}";
)
