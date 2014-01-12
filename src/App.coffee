React = require 'react'
Backbone = require 'backbone'
eventEmitter = require 'eventEmitter'

# query params and named parameters with this backbone plugin
require 'backbone-query-parameters'
Backbone.Router.namedParameters = true

# react touch events
React.initializeTouchEvents true

# namespace
App = {}

# events and shortcuts
App.events = new eventEmitter()
App.on = App.events.on.bind(App.events)
App.off = App.events.off.bind(App.events)
App.emit = App.events.emit.bind(App.events)

# router
App.router = new Backbone.Router()

# regions
App.regions = {}
  
# set region and trigger update event
App.setRegion = (name, component, props)->
  if App.regions[name] isnt component  
    App.regions[name] = {component: component, props: props}
    App.emit "regionUpdate", name, component, props
    
# get region component, or return empty function placeholder
App.renderRegion = (name)->
  region = App.regions[name]
  if region
    region.component(region.props)
  else
    ""
  
    
# start the app
App.dispatch = (element)->  
  React.renderComponent App.baseComponent(), element
  Backbone.history.start()
    
module.exports = App