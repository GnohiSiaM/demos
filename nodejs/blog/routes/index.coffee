'use strict'

router = require('express').Router()

router.get '/', (req, res) ->
  res.render 'index', title: 'A Blog Demo'

module.exports = router
