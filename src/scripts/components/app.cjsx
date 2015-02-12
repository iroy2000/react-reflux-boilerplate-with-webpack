# please pardon me for this too simple code, it is an example on how to use this workflow framework
React = require('react')
{Link, RouteHandler} = require('react-router')
LocalStorageUtil = require('../utils/LocalStorage')
LOCAL_STORAGE_PREFIX = 'wff' 

LocalStorageUtil.init(LOCAL_STORAGE_PREFIX)

module.exports = React.createClass
  render: ->
    <div>
        <header className="header">
            <div className="logo">
                <svg className="icon-i-roy logo center-block" dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-i-roy">'}} />
            </div>
            <div className="nav">
                <Link to="home">Example</Link>
                <Link to="aboutme">About Me</Link>
            </div>
        </header>
        <section className="page-content">
            <RouteHandler/>
        </section>
        <footer>
            Footer: This is just a sample, a tutorial ~ No Rights Reserved \o/
        </footer>
    </div>
