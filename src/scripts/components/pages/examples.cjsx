React = require('react')

ExampleIntro = require('./examples/intro')
FormExample = require('./examples/form-interaction')

module.exports = React.createClass
    render: ->
        return (
            <div>
                <ExampleIntro />
                <FormExample />
            </div>
        )
