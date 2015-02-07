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
    <Route name="about" handler={require('./about')} path="/" />
    <Route name="projects" handler={require('./projects')} path="/projects" />
    <Route name="examples" handler={require('./examples')} path="/examples" />
  </Route>
)
Router.run(routes, (Handler) ->
  React.render <Handler/>, document.getElementById("content")
)
