###* @jsx React.DOM ###

React = require 'react'

Header = require './Header.coffee'

module.exports = React.createClass
  render: ->
    `<div>
      <Header />
      <hr />
      <div id="container"></div>
    </div>`