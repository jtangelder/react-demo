App = require './App.coffee'

jQuery = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = jQuery


React = require 'react'
React.initializeTouchEvents true


App.layout = new require './layouts/Base.coffee'

App.controllers =
  'Main': new require './controllers/Main.coffee'
  'Page': new require './controllers/Page.coffee'

App.route = Backbone.Router.extend
  routes:
    "!":              "Main"
    "!page(/:query)": "Page"

App.start()