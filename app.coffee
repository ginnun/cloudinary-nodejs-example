require('./globals')

express = require('express')
cons    = require('consolidate')

assets  = [
  "#{__dirname}/assets/js"
  "#{__dirname}/assets/css"
]

app.configure ->
  app.engine('dust', cons.dust)
  app.set 'port', process.env.PORT or 3000
  app.set 'version', require('./package').version
  app.set 'description', require('./package').description
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'dust'
  app.use express.urlencoded()
  app.use express.json()
  app.use express.methodOverride()
  app.use app.router

app.configure 'development', ->
  app.use express.logger('dev')
  app.use express.static("#{__dirname}/public")
  app.use require('connect-assets')(paths: assets)
  app.use express.compress()

app.configure 'test', 'production', ->
  app.use express.static("#{__dirname}/public", maxAge: 86400000)
  app.use require('connect-assets')(paths: assets, build: true)
  app.use express.compress()

require('./routes')
require('./locals')

server = require('http').createServer(app)
server.listen app.get("port"), ->
  console.log("Server started on : " + app.get("port"))