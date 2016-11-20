'use strict'

mongoose = require('mongoose')

Schema = mongoose.Schema

CommentSchema = new Schema(
  username:
    type: String
    required: true

  content:
    type: String
    required: true

  createdAt:
    type: String
    required: true
    default: Date.now
)

PostSchema = new Schema(
  title:
    type: String
    required: true

  content:
    type: String
    required: true

  createdAt:
    type: String
    required: true
    default: Date.now

  updatedAt:
    type: String
    required: true
    default: Date.now

  comments:
    type: [CommentSchema]
)

module.exports = mongoose.model('post', PostSchema)
