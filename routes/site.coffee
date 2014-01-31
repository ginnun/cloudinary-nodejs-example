render_home = (req, res, errors) ->
  cloudinary_cors = "http://#{req.headers.host}/cloudinary_cors.html"
  tag = cloudinary.uploader.image_upload_tag('image_id', { callback: cloudinary_cors })
  res.render('templates/home', model: _.extend({cloudinary_file_tag: tag}, req.body) , errors: errors)

exports.index = (req, res) ->
  render_home req,res

exports.validate = (req, res, next) ->
  validator.validateUserForm req.body, ->
    helpers.backend.save_user req.body, ->
      next()
    ,(backend_errors) ->
      render_home req, res, backend_errors
  ,(msgs) ->
    render_home req, res, msgs

exports.show = (req, res, next) ->

  model =
    cloudinary_file_view: helpers.cloudinary.create_image_view(req.body.public_image_id, req.body.image_format)
    name: req.body.name
    email: req.body.email
    password: req.body.password

  res.render('templates/show', model: model)

exports.error = (err, req, res, next) ->
  res.format
    html: -> res.status(err.status or 500).render("errors/error", {url: req.url, status_code: (err.status or res.statusCode), err: err})
    json: -> res.json(err.status or 500, {url: req.url, error: err.message})

exports.not_found = (req, res, next) ->
  exports.error({ status: 404 }, req, res, next)