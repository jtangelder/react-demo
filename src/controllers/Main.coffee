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

module.exports =
  init: ->
    App.router.route "", "main", ()->
      console.log App, arguments
      React.renderComponent `<Component />`, App.viewElement

  component: Component
