global._          = require('underscore')
global.app        = require('express')()
global.dust       = require('dustjs-linkedin')
global.validator  = require('./validator')

require('./configs')

global.cloudinary = require('cloudinary')
cloudinary.config
  cloud_name: global.config.cloudinary.cloud_name,
  api_key: global.config.cloudinary.api_key,
  api_secret: global.config.cloudinary.api_secret

global.cloudinary = cloudinary

require('./helpers')

