nock = require("nock")
chars256 = "X"
chars256 += "X" for i in [0..255]

describe 'All flow', ->
  scope = null
  _browser = null

  beforeEach (done) ->
    fake_backend.resetMocks()
    scope = fake_backend.succesfullMock()

    _browser = new browser
    _browser.visit "/", done

  it 'successful submit', (done) ->

    _browser.visit "/", ->
      _browser
      .fill("name","test name")
      .fill("email","test@test.com")
      .fill("password","password")
      .fill("public_image_id", "photoId")
      .fill("image_format", "imageFormat")
      .pressButton "Submit", ->
        expect(_browser.success).to.be.ok #page successfully loaded
        expect(scope.isDone()).to.be.true  #backend triggered
        expect(_browser.text(".name")).to.be.equal("test name")
        expect(_browser.text(".email")).to.be.equal("test@test.com")
        done()


  it 'shows error if name is missing', (done) ->

    _browser
      .fill("email","test@test.com")
      .fill("password","password")
      .fill("public_image_id", "photoId")
      .fill("image_format", "imageFormat")
      .pressButton "Submit", ->
        expect(_browser.success).to.be.ok #page successfully loaded
        expect(scope.isDone()).to.be.false #backend not triggered
        expect(_browser.query(".error-name")).to.be.not.null
        done()

  it 'shows error if name is too short', (done) ->

    _browser
    .fill("name","t")
    .fill("email","test@test.com")
    .fill("password","password")
    .fill("public_image_id", "photoId")
    .fill("image_format", "imageFormat")
    .pressButton "Submit", ->
      expect(_browser.success).to.be.ok #page successfully loaded
      expect(scope.isDone()).to.be.false #backend not triggered
      expect(_browser.query(".error-name")).to.be.not.null
      done()


  it 'shows error if name is too long', (done) ->

    _browser
    .fill("name",chars256)
    .fill("email","test@test.com")
    .fill("password","password")
    .fill("public_image_id", "photoId")
    .fill("image_format", "imageFormat")
    .pressButton "Submit", ->
      expect(_browser.success).to.be.ok #page successfully loaded
      expect(scope.isDone()).to.be.false #backend not triggered
      expect(_browser.query(".error-name")).to.be.not.null
      done()


  it 'shows error if email is missing', (done) ->

    _browser
      .fill("name","test name")
      .fill("password","password")
      .fill("public_image_id", "photoId")
      .fill("image_format", "imageFormat")
      .pressButton "Submit", ->
        expect(_browser.success).to.be.ok #page successfully loaded
        expect(scope.isDone()).to.be.false #backend not triggered
        expect(_browser.query(".error-email")).to.be.not.null
        done()


  it 'shows error if email is invalid', (done) ->

    _browser
    .fill("email","test@test")
    .fill("name","test name")
    .fill("password","password")
    .fill("public_image_id", "photoId")
    .fill("image_format", "imageFormat")
    .pressButton "Submit", ->
      expect(_browser.success).to.be.ok #page successfully loaded
      expect(scope.isDone()).to.be.false #backend not triggered
      expect(_browser.query(".error-email")).to.be.not.null
      done()


  it 'shows error if password is missing', (done) ->

    _browser
      .fill("name","test name")
      .fill("email","test@test.com")
      .fill("public_image_id", "photoId")
      .fill("image_format", "imageFormat")
      .pressButton "Submit", ->
        expect(_browser.success).to.be.ok #page successfully loaded
        expect(scope.isDone()).to.be.false #backend not triggered
        expect(_browser.query(".error-password")).to.be.not.null
        done()

  it 'shows error if password is too short', (done) ->

    _browser
    .fill("password","pass")
    .fill("name","test name")
    .fill("email","test@test.com")
    .fill("public_image_id", "photoId")
    .fill("image_format", "imageFormat")
    .pressButton "Submit", ->
      expect(_browser.success).to.be.ok #page successfully loaded
      expect(scope.isDone()).to.be.false #backend not triggered
      expect(_browser.query(".error-password")).to.be.not.null
      done()


  it 'shows error if password is too long', (done) ->

    _browser
    .fill("password",chars256)
    .fill("name","test name")
    .fill("email","test@test.com")
    .fill("public_image_id", "photoId")
    .fill("image_format", "imageFormat")
    .pressButton "Submit", ->
      expect(_browser.success).to.be.ok #page successfully loaded
      expect(scope.isDone()).to.be.false #backend not triggered
      expect(_browser.query(".error-password")).to.be.not.null
      done()


  it 'shows error if image is missing', (done) ->

    _browser
      .fill("name","test name")
      .fill("email","test@test.com")
      .fill("password","password")
      .pressButton "Submit", ->
        expect(_browser.success).to.be.ok #page successfully loaded
        expect(scope.isDone()).to.be.false #backend not triggered
        expect(_browser.query(".error-image")).to.be.not.null
        done()


