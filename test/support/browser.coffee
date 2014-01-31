zombie = require('zombie')

class Browser extends zombie

  constructor: ->
    opts =
      site: 'http://localhost:3001'
      silent: true
      waitFor: 300
    super(opts)

module.exports = Browser