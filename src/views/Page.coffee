###* @jsx React.DOM ###

React = require 'react'

module.exports = React.createClass
  componentDidMount: ->
    @interval = setInterval(
      (=> @setState now: new Date().getTime()),
      20)

  componentWillUnmount: ->
    clearInterval @interval
    
  getInitialState: ->
    now: new Date().getTime()
    
  render: ->
    styles =
      background: 'red'
    
    return `<div>
              <h1 style={styles}><span>Page</span></h1>
              <p>This is a normal page</p>
              <h2>{this.state.now}</h2>              
              <p><textarea>Type something</textarea></p>
              <p>{JSON.stringify(this.props.path)}</p>
              <p>{JSON.stringify(this.props.query)}</p>
            </div>`