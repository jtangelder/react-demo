App = require './App.coffee'

# init the controllers
require('./controllers/Main.coffee')()
require('./controllers/Page.coffee')()

App.baseComponent = require './layouts/Base.coffee'
App.dispatch(document.body)