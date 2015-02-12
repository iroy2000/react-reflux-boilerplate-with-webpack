require '../../../public/main.css'

React = require 'react'

# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Router = require('react-router')
Route = Router.Route

# Require route components.
App = require './app'

routes = (
  <Route handler={App}>
    <Route name="home" handler={require('./pages/home')} path="/" />
    <Route name="aboutme" handler={require('./pages/aboutme')} path="/aboutme" />
  </Route>
)
Router.run(routes, (Handler) ->
  React.render <Handler/>, document.getElementById("container")
)
