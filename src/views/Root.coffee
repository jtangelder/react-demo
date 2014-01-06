###* @jsx React.DOM ###
  
React = require 'React'
router = require './Router.coffee'

Header = require './layout/Header.coffee'

React.renderComponent `
  <div>
    <Header />
    {router.getViewComponent()()}
  </div>`,
  document.getElementById('container')