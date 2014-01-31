site = require('./site')

app.get '/', site.index
app.post '/', site.validate, site.show
app.use site.error
app.use site.not_found