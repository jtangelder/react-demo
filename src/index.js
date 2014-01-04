/** @jsx React.DOM */

var ct = require('./style.coffee');
var HelloMessage = require('./react/helloMessage.coffee');

React.renderComponent(<HelloMessage name="John" />, document.getElementById('container'));