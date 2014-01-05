React = require 'react'

ViewRouter =
  routes : {}
  
  normalizePath: (path)->
    path = path.split("/")
    path.unshift("/") # always start with an /
    path.push("/") # always end with an /
    return path.join("/").replace(/\/{2,}/g, "/")
    
    
  parseQueryString: (query)->
    query = decodeURI(query)
    qparts = query.split(/&/g)
    params = {}
    for param in qparts
      [name, val] = param.split("=")
      params[name] = val
    params
    
    
  normalizeHash: (hash)->
    hash = hash.replace(/^#!/, '')
    
    [path, query] = hash.split("?")

    path = @normalizePath(path)
    if query then params = @parseQueryString(query)
      
    full = "#{(path or "")}#{(if query then "?"+query else "")}"
    return [path, params or {}, full]
    
    
  getRouteByPath: (path)->    
    # find url matching...
    for [regex, component] in @routes       
      if matches = path.match(new RegExp(regex))
        return [component, matches.slice(1)];
      
    # ...or go to the root..
    getRouteByPath("/")
  
    
  navigate: (hash)->
    window.location.hash = @getUrl(hash)
    
    
  url: (hash)->
    [path, query, full] = @normalizeHash(hash)
    return "#!#{full}"
    
    
  getViewComponent: -> 
    vr = this  
    React.createClass
      getStateData: (hash=window.location.hash)->
        [path, query] = vr.normalizeHash(hash)    
        [component, params] = vr.getRouteByPath(path)
        
        component: component
        params: params
        path: path
        query: query
        
      changeView: ->
        if window.location.hash.indexOf("#!") is 0
          @setState @getStateData()
        
      componentWillUnmount: -> window.removeEventListener 'hashchange', @changeView
      componentDidMount: -> window.addEventListener 'hashchange', @changeView
    
      getInitialState: ->
        @getStateData()
    
      render: ->
        this.state.component(
          params: this.state.params
          path: this.state.path
          query: this.state.query
        )
  
module.exports = ViewRouter