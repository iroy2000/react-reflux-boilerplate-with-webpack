React = require('react/addons')
EventActions = require('../../actions/EventActions')
_ = require('lodash')

module.exports = React.createClass
    mixins: [React.addons.LinkedStateMixin]
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

        title = @state.title.trim()
        description = @state.description
        
        titleErrorClass = ''
        descriptionErrorClass = ''

        error = []

        if not title
            error.push('Title is required')  
            titleErrorClass = 'in-error'
        else
            matches = _.matches({ 'name': title })
            
            if _.size(_.find(@props.items, matches)) > 0
                error.push('Title needs to be unique')
                titleErrorClass = 'in-error'

        if not description
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
        else
            EventActions.create({
                name: title
                description: description
                expire: Date.now()
            })

            state.title = ''
            state.description = ''
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
                    <input 
                        name="title" 
                        className={@state.container.className.title} 
                        placeholder="Enter a Title" 
                        valueLink={@linkState('title')} />

                    <textarea 
                        name="description" 
                        className={@state.container.className.description} 
                        placeholder="Enter a Description" 
                        valueLink={@linkState('description')} />

                    <input 
                        className="btn submit" 
                        type="submit" 
                        value="Create Event" 
                        onClick={@handleOnSubmit} />
                </form>
            </div>
        )
