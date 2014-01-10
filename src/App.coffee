React = require 'react'
Backbone = require 'backbone'

# query params and named parameters with this backbone plugin
require 'backbone-query-parameters'
Backbone.Router.namedParameters = true

App =
  controllers: []
  router: null
  viewElement: document.body

module.exports = App