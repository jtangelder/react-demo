###* @jsx React.DOM ###

React = require 'react'
App = require '../App.coffee'

App.setRegion "header", require './Header.coffee'
App.setRegion "main", -> ""

module.exports = React.createClass
  componentDidMount: ->
    App.on "regionUpdate", (name, component)=>
      @forceUpdate()

  render: ->
    `<div>
      {App.renderRegion('header')}
      {App.renderRegion('main')}
    </div>`