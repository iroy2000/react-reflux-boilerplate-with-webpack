React = require('react')

module.exports = React.createClass
    getInitialState: ->
        {
            isInEditPhase: false
        }

    onEditRequest: (e) ->
        e.preventDefault()

        @setState({
            isInEditPhase: true
        })
    
    onEdit: (e) ->
        e.preventDefault()
        
        @props.editItem({
            name: @props.name
            description: @refs.content.getDOMNode().innerHTML
        })

        @setState({
            isInEditPhase: false
        })

    render: ->
        editState    = <a href="#" onClick={@onEditRequest}>Edit</a>
        contentState = <div ref="content" className="content">{@props.description}</div>

        if @state.isInEditPhase 
           editState    = <a href="#" onClick={@onEdit}>Submit</a>
           contentState = <div ref="content" className="content editing" contentEditable="true">{@props.description}</div>
   
        <div className="item">
            <div className="header">{@props.name}</div>
            {contentState}
            <div className="actions">
                <a href="#" onClick={@props.onDelete}>Remove</a>
                {editState}
            </div>
        </div>
