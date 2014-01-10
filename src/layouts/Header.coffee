###* @jsx React.DOM ###

React = require 'react'
App = require '../../App.coffee'

module.exports = React.createClass
  render: ->
    `<div>
      <h1>My React site</h1>
      <ul>
        <li><a href="#!">Home</a></li>
        <li><a href="#!page">Page</a></li>
        <li><a href="#!page/123">Other page</a></li>
        <li><a href="#!page/456">Query page</a></li>
        <li><a href="#!page/123jh?parameras=1sfjhs">Query page</a></li>
      </ul>
    </div>`