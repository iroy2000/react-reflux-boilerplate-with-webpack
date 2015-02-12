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
            [ <b>Note</b> ]  This page is developed with <b>React, Reflux, Stylus, CoffeeScript and packaged with Gulp and Webpack</b> as a demo site. Go to "About Me" for more info.  Enjoy ~ \o/
        </footer>
    </div>
