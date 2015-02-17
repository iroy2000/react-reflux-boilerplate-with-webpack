# please pardon me for this too simple code, it is an example on how to use this workflow framework
React = require('react/addons')
Router = require('react-router')
{ Route, RouteHandler, Link } = Router
LocalStorageUtil = require('../utils/LocalStorage')
# TransitionGroup = React.addons.CSSTransitionGroup

LOCAL_STORAGE_PREFIX = 'wff' 

LocalStorageUtil.init(LOCAL_STORAGE_PREFIX)

module.exports = React.createClass
  # mixins: [ Router.State ]
  render: ->
    <div>
        <header className="header">
            <div className="logo-container">
                <svg className="icon-i-roy logo center-block" dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-i-roy">'}} />
            </div>
            <div className="banner">
                <div class="banner">
                    <p>This page is created with ♥ by using React + Reflux + Stylus</p>
                    <p dangerouslySetInnerHTML={{__html: 'My name is Roy and I am a Developer <span>|</span>'}}></p>
                </div>
            </div>
        </header>
        <div className="container">
            <div className="nav" activeClassName="active">
                <Link to="aboutme">
                    <svg className="icon-aboutme" dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-aboutme">'}} />
                    About Me
                </Link>
                <Link to="examples" activeClassName="active">
                    <svg className="icon-examples" dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-examples">'}} />
                    Examples
                </Link>
            </div>
            <section className="page-content">
                <RouteHandler />
            </section>
        </div>
        <footer>
            My name is Roy and I am a Developer  ~♡ⓛⓞⓥⓔ♡~
            <p>
                This page is developed with React / Reflux Workflow Boilerplate  »»--------------► https://github.com/iroy2000/react-reflux-boilerplate-with-webpack
            </p>
        </footer>
    </div>
