###* @jsx React.DOM ###

React = require 'react'

Header = require './Header.coffee'

module.exports = React.createClass
  getInitialState: ->
    {}

  render: ->
    `<div>
      <Header />
      <hr />
      {this.state.component || ""}
    </div>`