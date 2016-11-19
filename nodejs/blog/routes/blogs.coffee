'use strict'

express = require('express')
Promise = require('bluebird')

BlogModel = require('../models/BlogModel')
router = express.Router()

Promise.promisifyAll require('mongoose')

# get blog list listing.
router.get '/list/?', (req, res, next) ->
  BlogModel.findAsync()
  .then (docs) ->
    res.render 'blog_list',
      list: docs
  , next


# add new blog.
router.get '/new/?', (req, res) ->
  res.render 'blog_new'

router.post '/create/?', (req, res, next) ->
  blog = new BlogModel(
    title: req.body.title
    text: '\n' + req.body.text
  )
  blog.saveAsync()
  .then (records) ->
    res.redirect '/blogs/detial/' + records[0]._id
  , next


# get blog detial.
router.get '/detial/:blogID/?', (req, res, next) ->
  BlogModel.findByIdAsync(req.params.blogID)
  .then (blogInfo) ->
    res.render 'blog_detial',
      blogInfo: blogInfo
  , next


# delete a blog.
router.get '/delete/:blogID/?', (req, res, next) ->
  BlogModel.findByIdAndRemoveAsync(req.params.blogID)
  .then ->
    res.redirect '/blogs/list'
  , next


# update a blog.
router.get '/update/:blogID/?', (req, res, next) ->
  BlogModel.findByIdAsync(req.params.blogID)
  .then (blogInfo) ->
    res.render 'blog_edit',
      blogInfo: blogInfo
  , next

router.post '/update/?', (req, res, next) ->
  BlogModel.findByIdAndUpdateAsync(req.body.blogID,
    $set:
      title: req.body.title
      text: '\n' + req.body.text
  ).then ->
    res.redirect '/blogs/detial/' + req.body.blogID
  , next


# add a comment.
router.post '/comment/?', (req, res, next) ->
  now = new Date()
  addtime = now.getFullYear() + '-' +
    (now.getMonth() + 1) + '-' +
    now.getDate() + ' ' +
    now.getHours() + ':' +
    now.getMinutes()
  comment =
    username: req.body.username
    comment: req.body.comment
    time: addtime

  BlogModel.findByIdAndUpdateAsync(req.body.blogID,
    $push:
      comments: comment
  ).then ->
    res.redirect '/blogs/detial/' + req.body.blogID
  , next

module.exports = router
