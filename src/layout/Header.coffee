###* @jsx React.DOM ###

React = require 'react'

module.exports = React.createClass
  render: ->
    return `<div>
              <h1>My React site</h1>
              <ul>
                <li><a href={"#!/"}>Home</a></li>
                <li><a href={"#!/page"}>Page</a></li>
                <li><a href={"#!/page/123"}>Other page</a></li>
                <li><a href={"#!/page/123?param=asd&another=12"}>Query page</a></li>
              </ul>
            </div>`