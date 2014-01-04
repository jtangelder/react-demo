###* @jsx React.DOM ###

HelloMessage = React.createClass
  render: ->
    `<div>{'Hallo ' + this.props.name}</div>`
  
module.exports = HelloMessage