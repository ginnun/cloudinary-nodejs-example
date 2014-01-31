exports.create_image_view = (public_image_id, image_format) ->
  image_opts =
    alt: "your image"
    format: image_format
    crop: 'scale'
    width: 200

  cloudinary.image(public_image_id, image_opts)