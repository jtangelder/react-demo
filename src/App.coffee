React = require 'react'
Backbone = require 'backbone'

# query params and named parameters with this backbone plugin
require 'backbone-query-parameters'
Backbone.Router.namedParameters = true

App =
  controllers: {}
  element: document.body
  route: null
  router: null
  layout: null

  # start router
  start: ->
    if !App.route then return

    baseView = App.layout()
    React.renderComponent baseView, App.element

    App.router = new App.route()
    App.router.on "route", (controller, params)->
      component = App.controllers[controller](params[0])

      baseView.setState
        component: component

    Backbone.history.start()

module.exports = App