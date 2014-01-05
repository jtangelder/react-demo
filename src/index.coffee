###* @jsx React.DOM ###

React = require 'react'
ViewRouter = require './ViewRouter.coffee'

React.initializeTouchEvents true
require "./styles.css"


# setup router
router = new ViewRouter
router.routes = [
  ["^/page/", require './views/Page.coffee']
  ["^/", require './views/Main.coffee']
]

# start  
Header = require './layout/Header.coffee'
React.renderComponent `
  <div>
    <Header />
    {router.getComponent()()}
  </div>`,
  document.getElementById('container')