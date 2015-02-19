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
                <div className="banner">
                    <p dangerouslySetInnerHTML={{__html: 'My name is Roy <br />And I am a Developer <span>_</span>'}}></p>
                </div>
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
            </div>
        </header>
        <div className="container">
            <section className="page-content">
                <RouteHandler />
            </section>
        </div>
        <footer>
            <div className="content">
                My name is Roy and I am a Developer
                <div className="large">~♡ⓛⓞⓥⓔ♡~</div>
            </div>
        </footer>
    </div>
