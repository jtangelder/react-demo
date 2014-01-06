###* @jsx React.DOM ###

React = require 'react'

module.exports = React.createClass
  render: ->
    data = {}
    for prop in ['props','state']
      data[prop] = for own key, value of this.props.__owner__[prop] when key isnt '__owner__' then "#{key}: #{JSON.stringify(value)}"
      
    return `<div>
              <dl>
                <dt>Properties</dt>
                <dd>{data.props.join(", ")}</dd>
                <dt>State</dt>
                <dd>{data.state.join(", ")}</dd>
              </dl>
            </div>`