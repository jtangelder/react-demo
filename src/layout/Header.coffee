###* @jsx React.DOM ###

React = require 'react'
router = require('../ViewRouter.coffee')

module.exports = React.createClass
  render: ->
    return `<div>
              <h1>My React site</h1>
              <ul>
                <li><a href={router.url("/")}>Home</a></li>
                <li><a href={router.url("/page")}>Page</a></li>
                <li><a href={router.url("/page/123")}>Other page</a></li>
                <li><a href={router.url("/page/654?param=asd&another=12")}>Query page</a></li>
                <li><a href={router.url("/bestaat-niet")}>Query page</a></li>
              </ul>
            </div>`