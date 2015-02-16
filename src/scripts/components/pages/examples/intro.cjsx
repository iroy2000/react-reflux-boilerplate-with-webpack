React = require('react')
GenericContent = require('../../modules/generic-content')

module.exports = React.createClass
    render: ->
        return (
            <div className="intro" >
                <GenericContent title="Intro">
                    This demo is developed using <strong>React</strong> and <strong>Reflux</strong> plus various technologies.  However, its purpose is mainly to show case on how to use <strong>React, React Router, Reflux's Action and Store</strong>. The full source code is in the boilerplate github link below.
                    <br /><br />

                         Not just a demo, but I have recently created a <strong>React + Reflux workflow boilerplate</strong> in the hope that the <strong>React / Reflux community</strong>
                          can benefit from it ( actually this demo is developed with that workflow boilerplate ).
                         What it will do is to make your development process more robust and you can extend on top of it.
                         Please browse the repo for more detail and how to be benefit from it.
                    <br /><br />
                        The following is the repo and contain the source code for this demo :-
                    <br /><br />
                        <a href="https://github.com/iroy2000/react-reflux-boilerplate-with-webpack">https://github.com/iroy2000/react-reflux-boilerplate-with-webpack</a><br />
                    <br /><br />
                        Hope you enjoy :)
                    <br /><br />
                </GenericContent>
            </div>
        )
