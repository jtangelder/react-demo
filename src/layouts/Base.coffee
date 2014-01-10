###* @jsx React.DOM ###

React = require 'react'
App = require '../App.coffee'

Header = require '../components/layout/Header.coffee'

module.exports = React.createClass
  render: ->
    `<div>
      <Header />
      <hr />
      {this.state.component}
    </div>`