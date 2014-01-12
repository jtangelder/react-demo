###* @jsx React.DOM ###

React = require 'react'
App = require '../App.coffee'
Debug = require '../components/Debug.coffee'


Component = React.createClass
  componentDidMount: ->
    @interval = setInterval(
      (=> @setState now: new Date().getTime()), 30)
    
    App.on "pageSetText", (text)=>      
      @setState textvalue: text

  componentWillUnmount: ->
    clearInterval @interval
    App.event.removeAllListeners "pageSetText"

  getInitialState: ->
    now: new Date().getTime()

  handleTextValue: (ev)->
    @setState textvalue: ev.target.value

  render: ->
    `<div>
      <h1><span>Page</span></h1>
      <p>This is a normal page</p>

      <h2>{this.state.now}</h2>

      <p><textarea onChange={this.handleTextValue} placeholder="Type something"></textarea></p>
      <h3>{this.state.textvalue || "Empty"}</h3>

      <Debug />
    </div>`


module.exports = ->
  pageController =  (params)->
    App.setRegion "main", Component, params
  
  App.router.route "page", "page", pageController    
  App.router.route "page/:query", "page", pageController
