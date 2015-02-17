React = require('react/addons')
EventItem = require('./event-item')
EventActions = require('../../actions/EventActions')
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

module.exports = React.createClass

    render: ->
        currentProps = @props

        if @props.items.length <= 0
            list = <div>You have no notes currently, please create one.</div>
        else
            list = @props.items.map((item, key) ->
                deleteCallback = (e) ->
                    e.preventDefault()
                    currentProps.removeItem(item)

                <EventItem
                    onDelete={deleteCallback}
                    item={item}
                    editItem={currentProps.editItem}
                    name={item.name}
                    description={item.description} />
            )

        return (
            <div className="events">
                <h1>{@props.title}</h1>
                <div className="list">
                    <ReactCSSTransitionGroup transitionName="list">
                        {list}
                    </ReactCSSTransitionGroup>
                </div>
            </div>
        )
