React = require('react')
Reflux = require('reflux')
_ = require('lodash')
SampleEvents = require('../../modules/events')
Form = require('../../modules/event-create-form')
SearchBox = require('../../modules/event-search')
Filter = require('../../modules/event-filter')
EventStore = require('../../../stores/EventStore')
EventActions = require('../../../actions/EventActions')

module.exports = React.createClass
    mixins: [Reflux.connect(EventStore, "items")]
    getInitialState: ->
        {
            items: []
        }

    removeItem: (item) ->
        index = @state.items.indexOf(item)
        @state.items.splice(index, 1)
        EventActions.update(@state.items)

    editItem: (item) ->
        items = @state.items

        items = _.map(items, (el) ->
            if (el.name == item.name) 
                return item
            else
                return el
        )

        EventActions.update(items)

    componentDidMount: ->
        EventActions.get('active')
        
    render: ->

        return (
            <div className="section">
                <h1>React + Reflux Examples</h1>
                <div className="form-interaction-example">
                    <Filter />
                    <SearchBox />
                    <Form title="Create a Note" items={@state.items} />
                    <SampleEvents
                        title="My Notes"
                        removeItem={@removeItem}
                        editItem={@editItem}
                        items={@state.items} />
                </div>
            </div>
        )
