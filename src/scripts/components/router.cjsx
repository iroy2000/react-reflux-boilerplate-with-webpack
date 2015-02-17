require '../../../public/main.css'

React = require 'react'

# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Router = require('react-router')
{Route, NotFoundRoute} = Router


# Require route components.
App = require './app'

Examples = require './pages/examples'

routes = (
  <Route handler={App}>
    <Route name="examples" handler={Examples} path="/" addHandlerKey={true} />
    <Route name="aboutme" handler={require('./pages/aboutme')} path="/aboutme" addHandlerKey={true} />
    <NotFoundRoute handler={Examples} />
  </Route>
)
Router.run(routes, (Handler) ->
  React.render <Handler/>, document.getElementById("container")
)
