React = require('react')
EventActions = require('../../actions/EventActions')
_ = require('lodash')

module.exports = React.createClass
    getInitialState: ->
        {
            error: false
            msg: [],
            container: {
                className: {
                    title: ''
                    description: ''
                }
            }
        }
    
    handleOnSubmit:(e) ->
        e.preventDefault()

        titleDOM = @refs.title.getDOMNode()
        descriptionDOM = @refs.description.getDOMNode()
        
        titleErrorClass = ''
        descriptionErrorClass = ''

        error = []

        if not titleDOM.value
            error.push('Title is required')  
            titleErrorClass = 'in-error'
        else
            matches = _.matches({ 'name': titleDOM.value })
            
            if _.size(_.find(@props.items, matches)) > 0
                error.push('Title needs to be unique')
                titleErrorClass = 'in-error'

        if not descriptionDOM.value
            error.push('Description is required')
            descriptionErrorClass = 'in-error'

        state = {
            msg: error,
            container: {
                className: {
                    title: titleErrorClass
                    description: descriptionErrorClass
                }
            }
        }

        if error.length > 0
            state.error = true
            @setState(state)
        else
            EventActions.create({
                name: titleDOM.value
                description: descriptionDOM.value
            })

            titleDOM.value = ''
            descriptionDOM.value = ''

            state.error = false
            @setState(state)

    render: ->

        errorList = []

        if @state.error
            for error in @state.msg
                errorList.push(
                    <div className="error">{error}</div>
                )

        return ( 
            <div className="event-input-container">
                <h3 className="title">{@props.title}</h3>
                <div className="errors">
                    {errorList}
                </div>
                <form className="event-input" ref="event-input-form">
                    <input name="title" ref="title" className={@state.container.className.title} placeholder="Enter a Title" />
                    <textarea name="description" ref="description" className={@state.container.className.description} placeholder="Enter a Description" />
                    <input className="btn submit" type="submit" value="Create Event" onClick={@handleOnSubmit} />
                </form>
            </div>
        )
