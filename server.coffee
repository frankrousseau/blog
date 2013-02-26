express = require 'express'
app = express()
poet = require('poet')(app)

poet.set
  posts: './_posts/',
  postsPerPage: 5,
  metaFormat: 'json'

poet.createPostRoute()
  .createPageRoute()
  .createTagRoute()
  .createCategoryRoute()
  .init()

  
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use express.static( __dirname + '/public' )
app.use app.router

app.get '/', (req, res) -> res.render('index')

app.listen 3000