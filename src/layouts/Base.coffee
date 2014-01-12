###* @jsx React.DOM ###

React = require 'react'
App = require '../App.coffee'

require 'bootstrap/dist/css/bootstrap.css'
require 'bootstrap/dist/css/bootstrap-theme.css'

App.setRegion "header", require './Header.coffee'
App.setRegion "main", -> ""

module.exports = React.createClass
  componentDidMount: ->
    App.on "regionChange", (name, component)=>
      @forceUpdate()

  render: ->
    `<div class="container">
      {App.renderRegion('header')}
      {App.renderRegion('main')}
    </div>`