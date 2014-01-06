###* @jsx React.DOM ###

React = require 'react'
Cursor = require '../components/Cursor.coffee'
Debug = require '../components/Debug.coffee'

module.exports = React.createClass
  componentDidMount: ->
    @interval = setInterval(
      (=> @setState now: new Date().getTime()), 200)
    
  componentWillUnmount: ->
    clearInterval @interval
    
  getInitialState: ->
    now: new Date().getTime()
    
  handleTextValue: (ev)->
    @setState textvalue: ev.target.value
    
  render: ->
    styles =
      backgroundColor: "#"+ parseInt(this.props.path.split("/").join(""), 26).toString().substr(0,6) # random color, kind of

    return `<div>
              <h1 style={styles}><span>Page</span></h1>
              <p>This is a normal page</p>
              <h2>{this.state.now}</h2>              
              <p><textarea onChange={this.handleTextValue} placeholder="Type something"></textarea></p>
              <h3>{this.state.textvalue || "Empty"}</h3>
              <Debug />              
              <Cursor />
            </div>`