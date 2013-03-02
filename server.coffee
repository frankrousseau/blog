express = require 'express'
app = express()
poet = require('poet')(app)

poet.set
    posts: './_posts/',
    postsPerPage: 5,
    metaFormat: 'json'

poet.createPostRoute('/public/blog/post/:post', 'post')
    .createPageRoute('/public/blog/page/:page', 'page')
    .createTagRoute('/public/blog/tag/:tag', 'tag')
    .createCategoryRoute('/public/blog/category/:category', 'category')
    .init()

    
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use '/public', express.static(__dirname + '/public')
app.use '/', express.static(__dirname + '/public')
app.use app.router

app.get '/public', (req, res) -> res.render('index')

app.listen 3000
