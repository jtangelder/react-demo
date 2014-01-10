jQuery = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = jQuery

React = require 'react'
React.initializeTouchEvents true


App = require './App.coffee'
App.router = new Backbone.Router()

# init the controllers
require('./controllers/Main.coffee').init()
require('./controllers/Page.coffee').init()


# render base view
BaseView = require './layouts/Base.coffee'
React.renderComponent BaseView(), document.body


# setup app and go!
App.viewElement = jQuery('#container')[0]
Backbone.history.start()