request = require("request")

exports.authenticated_uri = "#{config.backend.uri}?apiKey=#{config.backend.apiKey}"

exports.save_user = (data, success, error) ->
  request_data =
    userName: data.name
    password: data.password
    email: data.email
    photoId: data.public_image_id
    imageFormat: data.image_format

  request_options =
    'uri': @authenticated_uri
    'headers':
      'Accept': '*/*'
    'json': request_data

  request.post request_options, (err, res) ->
    return error({errors: "Problem with the backend service!"}) if err?
    if res.statusCode == 200
      success()
    else
      error(res.body)