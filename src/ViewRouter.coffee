React = require 'react'

class ViewRouter
  constructor: ()->
    @routes = {}

  normalizeHash: (hash)->
    hash = hash.replace(/^#!/, '')
    
    [path, query] = hash.split("?")
    
    # path
    path = path.split("/")
    path.unshift("/") # always start with an /
    path.push("/") # always end with an /
    path = path.join("/").replace(/\/{2,}/g, "/")
    
    # query
    if query
      qparts = query.split("&")
      query_params = {}
      for param in qparts
        [name, val] = param.split("=")
        query_params[name] = val
    
    return [path, query_params || {}]
    
    
  getComponentByHash: (path)->    
    # find url matching...
    return obj for [regex, obj] in @routes when new RegExp(regex).test(path)
    # ...or go to the root..
    @getComponentByHash("/")
  
    
  getComponent: -> 
    vr = this  
    React.createClass
      getHashProps: (hash=window.location.hash)->
        [path, query] = vr.normalizeHash(hash)    
        
        component: vr.getComponentByHash(path)
        path: path
        query: query
    
      componentDidMount: ->
        window.addEventListener 'hashchange', =>
          @setState @getHashProps()
    
      getInitialState: ->
        @getHashProps()
    
      render: ->
        this.state.component(
          path: this.state.path
          query: this.state.query
        )
  
module.exports = ViewRouter