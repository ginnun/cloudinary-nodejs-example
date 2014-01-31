cluster     = require('cluster')
cpus        = require('os').cpus().length
description = require('./package').description

if cluster.isMaster
  cluster.on 'exit', (worker) ->
    console.log "#{description} #{worker.id} died.  restart..."
    cluster.fork()

  cluster.fork() while cpus--
else
  require('./app')
