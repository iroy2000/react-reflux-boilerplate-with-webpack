Reflux = require('reflux')
SampleActions = require('../actions/SampleActions')
SampleStore = require('../stores/SampleStore')

module.exports = React.createClass
    mixins: [Reflux.connect(SampleStore)]
    getInitialState: ->
        {
            msg: ''
            note: ''
        }

    handleSubmit:(e) ->
        e.preventDefault()
        name = @refs.name.getDOMNode().value
        
        SampleActions.greeting(@refs.name.getDOMNode().value)
    render: ->

        return <div>
            <h1>React + Reflux Example</h1>
            <h3>Example 1</h3>
            <p><strong>Note:</strong> This is just a show case that it has Reflux support, not a real tutorial ~</p>
            <form onSubmit={@handleSubmit}>
                <label><input type="text" ref="name" placeholder="Your Name" value={@state.name}  /></label>
                <button className="btn btn-primary btn-sm">Test</button>
            </form>
            <p>{@state.msg}</p>
            <p>{@state.note}</p>
        </div>
