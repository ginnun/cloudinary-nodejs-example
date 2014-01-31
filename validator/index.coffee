email_regex = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/

checkEmail = (str, fieldName) ->
  "'#{fieldName}' field should be a valid email" if not email_regex.test str

checkLength = (str, fieldName, min, max) ->
  "'#{fieldName}' field should be between #{min}-#{max} chars" if str.length < min or str.length > max

checkImage = (str) ->
  "You should upload an image" if not str

exports.validateUserForm = (data, successCallback, failCallback) ->
  validationMsgs = {}

  if (emailValidation = checkEmail(data.email, "Email"))
    validationMsgs.email = emailValidation

  if (nameValidation = checkLength(data.name, "Name",2,255))
    validationMsgs.name = nameValidation

  if (passwordValidation = checkLength(data.password, "Password", 5 ,255))
    validationMsgs.password = passwordValidation

  if (imageValidation = checkImage (data.public_image_id))
    validationMsgs.image = imageValidation

  if _.isEmpty(validationMsgs)
    successCallback()
  else
    failCallback validationMsgs