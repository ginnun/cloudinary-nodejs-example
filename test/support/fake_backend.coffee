_nock = require("nock")

nock = _nock(config.backend.uri)
postPath = "/users?apiKey=#{config.backend.apiKey}"

exports.resetMocks = _nock.cleanAll

exports.succesfullMock = ->
  nock.log(console.log)
  .post(postPath, {
    photoId: 'photoId'
    imageFormat: 'imageFormat'
    userName: 'test name'
    email: 'test@test.com'
    password: 'password'
  })
  .reply(200)