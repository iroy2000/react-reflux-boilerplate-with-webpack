React = require('react')

module.exports = React.createClass
    render: ->
        return (
            <div className="aboutme">
                <h1>About Me</h1>
                <p>
                    This demo is developed using <strong>React</strong> and <strong>Reflux</strong>.  It show cases how to use React, React Router, Reflux's Action and Store. The full source code is in the boilerplate repo below.
                </p>  
                <p>
                     And I have recently created a React + Reflux boilerplate in the hope that the React / Reflux community can benefit from it.   What it will do is to make your development process more robust and you can extend on top of it.  Please see the repo for more detail and how to be benefit from it. 
                </p>
                <p>
                    The following is the repo and contain the source code for this demo :-
                </p>                    
                <p>                
                    <a href="https://github.com/iroy2000/react-reflux-boilerplate-with-webpack">https://github.com/iroy2000/react-reflux-boilerplate-with-webpack</a><br />
                </p>
                <p>
                    Hope you enjoy :)
                </p>  
            </div>
        )   
