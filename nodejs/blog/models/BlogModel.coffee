'use strict'

mongoose = require('mongoose')

Schema = mongoose.Schema

CommentSchema = new Schema(
  username:
    type: String
    required: true

  comment:
    type: String
    required: true

  time:
    type: String
    required: true
    default: Date.now
)

BlogSchema = new Schema(
  title:
    type: String
    required: true

  text:
    type: String
    required: true

  comments:
    type: [CommentSchema]
)

module.exports = mongoose.model('blogs', BlogSchema)
