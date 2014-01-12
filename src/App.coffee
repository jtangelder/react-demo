React = require 'react'
Backbone = require 'backbone'
eventEmitter = require 'eventEmitter'

# query params and named parameters with this backbone plugin
require 'backbone-query-parameters'
Backbone.Router.namedParameters = true

# react touch events
React.initializeTouchEvents true

event = new eventEmitter()
router = new Backbone.Router()

# namespace
App = 
  # events and shortcuts
  event: event
  on: event.on.bind(event)
  off: event.off.bind(event)
  emit: event.emit.bind(event)
  
  # router
  router: router

  # regions
  regions: {}
  
  # set region and trigger update event
  setRegion: (name, component, props)->
    if @regions[name] is component then return
      
    @regions[name] = 
      component: component, 
      props: props
      
    @emit "regionUpdate", name, component, props
      
  # get region component, or return empty function placeholder
  renderRegion: (name)->
    region = @regions[name]
    if region
      region.component(region.props)
    else
      ""  
    
  # start the app
  dispatch: (element)->  
    React.renderComponent @baseComponent(), element
    Backbone.history.start()
      
module.exports = App