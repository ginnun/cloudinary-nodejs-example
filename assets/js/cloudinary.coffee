$.cloudinary.config
  cloud_name: "challenge"
  api_key: "875442677477769"

$(".cloudinary-fileupload").bind "cloudinarydone", (e, data) ->
  $(".preview").html $.cloudinary.image(data.result.public_id,
    format: data.result.format
    version: data.result.version
    crop: "scale"
    width: 200
  )
  $("#cimage").val data.result.public_id
  $("#cimage_format").val data.result.format
  true

$(".cloudinary-fileupload").bind "fileuploadprogress", (e, data) ->
  perc = Math.round((data.loaded * 100.0) / data.total)
  $(".progress_bar").text "%" + perc
  $(".progress_bar").css "width", perc + "%"
