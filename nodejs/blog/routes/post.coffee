'use strict'

Promise = require('bluebird')
router = require('express').Router()
Post = require('../models/Post')

Promise.promisifyAll require('mongoose')

router.get '/', (req, res, next) ->
  Post.findAsync()
  .then (posts) ->
    res.render 'post/list',
      posts: posts
  , next

router.get '/create', (req, res) ->
  res.render 'post/create'

router.get '/:id', (req, res, next) ->
  Post.findByIdAsync(req.params.id)
  .then (post) ->
    res.render 'post/detial',
      post: post
  , next

router.post '/', (req, res, next) ->
  post = new Post(
    title: req.body.title
    content: '\n' + req.body.content
  )
  post.saveAsync()
  .then (result) ->
    res.redirect '/posts/' + result._id
  , next

router.get '/:id/delete', (req, res, next) ->
  Post.findByIdAndRemoveAsync(req.params.id)
  .then ->
    res.redirect '/posts'
  , next

router.get '/:id/update', (req, res, next) ->
  Post.findByIdAsync(req.params.id)
  .then (post) ->
    res.render 'post/update',
      post: post
  , next

router.post '/:id/update', (req, res, next) ->
  console.dir req.body
  Post.findByIdAndUpdateAsync(req.params.id,
    $set:
      title: req.body.title
      content: '\n' + req.body.content
      updatedAt: Date.now()
  ).then ->
    res.redirect '/posts/' + req.params.id
  , next

# add a comment.
router.post '/:id/comments/', (req, res, next) ->
  comment =
    username: req.body.username
    content: req.body.content

  Post.findByIdAndUpdateAsync(req.params.id,
    $push:
      comments: comment
  ).then ->
    res.redirect '/posts/' + req.params.id
  , next

module.exports = router
