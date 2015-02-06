React = require('react')
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

# Provides global navigation for app e.g. the "Hello | Styleguide" at the top.
module.exports = React.createClass
  render: ->
    <div>
        <div className="row">
            <div className="col-sm-2">
                <svg className="icon-i-roy logo center-block" dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-i-roy">'}} />
            </div>
        </div>
        <div className="row">
            <header className="col-sm-9">
                <ul>
                    <li className="aboutme">
                        <Link to="about">About Me</Link>
                    </li>
                    <li className="projects">
                        <Link to="projects">Projects</Link>
                    </li>
                    <li className="contact">
                        <Link to="examples">Examples</Link>
                    </li>
                </ul>
            </header>
        </div>
        <div className="clearfix" />
        <div className="row content">
            <RouteHandler/>
        </div>
    </div>
