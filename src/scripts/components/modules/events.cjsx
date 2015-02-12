React = require('react')
EventItem = require('./event-item')
EventActions = require('../../actions/EventActions')

module.exports = React.createClass

    render: ->
        currentProps = @props

        list = @props.items.map((item, key) ->
            deleteCallback = (e) ->
                e.preventDefault() 
                currentProps.removeItem(item)

            <EventItem 
                onDelete={deleteCallback} 
                editItem={currentProps.editItem}
                name={item.name} 
                description={item.description} 
                expire="--" />
        )
         
        return (              
            <div className="events">
                <h1>{@props.title}</h1>
                <div className="list">
                    {list}
                </div>
            </div>
        )
