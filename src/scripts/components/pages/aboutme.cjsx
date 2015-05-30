React = require('react')
GenericContent = require('../modules/generic-content')

module.exports = React.createClass
    render: ->
        return (
            <div className="aboutme">
                <GenericContent title="About Me">
                    I have a passion for web development and architecture: from application design, frontend prototype to database design, I have experience and enjoyed every piece of it. I'm especially picky about user experience,  performance and security in web development.
                    <br /><br />
                    Specialties: Web development. LAMP stack (Linux, Apache, PHP, Mysql), JAVA, HTML, CSS, HTML5, CSS3, Javascript, jQuery, Backbone, React, Reflux, CoffeeScript, Stylus.
                </GenericContent>

                <GenericContent title="Speaking Experience">
                   <div>
                        <strong>Speaker @ HackingEDU 2015 ( PayPal )</strong>
                        <br />
                        Topic: How to think like a Hacker
                   </div>
                   <div>
                        <strong>Speaker @ Silicon Valley Code Camp 2014</strong>
                        <br />
                        Topic: Javascript BDD Unit Testing
                    </div>
                    <div>
                        <strong>Speaker @ Silicon Valley Code Camp 2013</strong>
                        <br />
                        Topic: Developing Backbone SPA
                    </div>
                    <div>
                        <strong>Web Development Instructor @ TSG</strong>
                        <br />
                        Topic: CSS3, HTML5, Javascript
                    </div>
                </GenericContent>

                <GenericContent title="Interests">
                    Cutting Edge Technology, Business Strategy, Web Development, Hiking, Badminton, Table Tennis, Reading, Soccer
                </GenericContent>
            </div>
        )   
