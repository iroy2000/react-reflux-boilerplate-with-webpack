React = require('react')

module.exports = React.createClass
    render: ->
        return (
            <div className="generic-content">
                <h2>{@props.title}</h2>
                <p className="content">{@props.children}</p>
            </div>
        )