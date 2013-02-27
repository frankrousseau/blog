express = require 'express'
app = express()
poet = require('poet')(app)

poet.set
    posts: './_posts/',
    postsPerPage: 5,
    metaFormat: 'json'

poet.createPostRoute('/public/post/:post', 'post')
    .createPageRoute('/public/page/:page', 'page')
    .createTagRoute('/public/tag/:tag', 'tag')
    .createCategoryRoute('/public/category/:category', 'category')
    .init()

    
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use express.static(__dirname + '/public')
app.use app.router

app.get '/public', (req, res) -> res.render('index')

app.listen 3000
