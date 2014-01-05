###* @jsx React.DOM ###

React = require 'react'

last_pos = 
  cursorX: 0
  cursorY: 0

module.exports = React.createClass
  setCursorPosition: (ev)->
    cursor = ev.touches?[0] or ev    
    last_pos = 
      cursorX: cursor.clientX 
      cursorY: cursor.clientY        
    @setState last_pos
      
  componentDidMount: ->
    window.addEventListener "mousemove", @setCursorPosition
    
  componentWillUnmount: ->
    window.removeEventListener "mousemove", @setCursorPosition
    
  getInitialState: ->
    last_pos
    
  render: ->
    style =
      background: 'rgba(0,0,0,.1)'
      width: '50px'
      height: '50px'
      position: 'fixed'
      margin: "-25px"
      borderRadius: '100%'
      pointerEvents: 'none'
      left: 0
      top: 0
      "transform": "translate(#{this.state.cursorX}px, #{this.state.cursorY}px)"
      "-webkit-transform": "translate(#{this.state.cursorX}px, #{this.state.cursorY}px)"

    return `<div style={style}></div>`