'use strict'

express = require('express')

router = express.Router()

# Get home page.
router.get '/', (req, res) ->
  res.render 'index', title: 'A simple blog'

module.exports = router
