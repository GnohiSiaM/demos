'use strict'

express = require('express')
path = require('path')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
mongoose = require('mongoose')
mongoose.Promise = require('bluebird')

index = require('./routes/index')
post = require('./routes/post')

app = express()

mongoose.connect 'mongodb://localhost:27017/blog'

# view engine setup.
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'pug'
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use express.static(path.join(__dirname, 'static'))
app.use '/', index
app.use '/posts', post

# catch 404 and forward to error handler.
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err

# development error handler, will print stacktrace.
if app.get('env') is 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err

# production error handler, no stacktraces leaked to user.
app.use (err, req, res) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}

module.exports = app
