###* @jsx React.DOM ###

React = require 'react'
App = require '../App.coffee'
Debug = require '../components/Debug.coffee'

Component = React.createClass
  render: ->
    styles =
      background: 'blue'

    `<div>
      <h1 style={styles}><span>Main</span></h1>
      <p>This is the Homepage</p>
      <p><textarea></textarea></p>

      <Debug component={this} />
    </div>`

module.exports = ->
  App.router.route "", "main", ()->
    App.setRegion "main", Component
