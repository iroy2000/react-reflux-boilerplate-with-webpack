React = require('react/addons')

module.exports = React.createClass
    mixins: [React.addons.LinkedStateMixin]
    getInitialState: ->
        {
            isInEditPhase: false
            description: @props.description
        }

    onEditRequest: (e) ->
        e.preventDefault()

        @setState({
            isInEditPhase: true
        }, () -> @refs.content.getDOMNode().focus())
    
    onEdit: (e) ->
        e.preventDefault()

        @setState({
            isInEditPhase: false
        }, () ->
            @props.editItem({
                name: @props.name
                description: @state.description
            })
        )

    render: ->
        editState    = <svg onClick={@onEditRequest} dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-edit">'}} />
        contentState = <div className="content-wrapper"><textarea ref="content" className="content" disabled="disabled" value={@props.description} /></div>

        if @state.isInEditPhase
           editState    = <svg onClick={@onEdit} dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-ok">'}} />
           contentState = <div className="content-wrapper"><textarea ref="content" className="content editing" valueLink={@linkState('description')} /></div>

        <div className="item">
            <div className="header">{@props.name}</div>
            {contentState}
            <div className="actions">
                <svg onClick={@props.onDelete} dangerouslySetInnerHTML={{__html: '<use xlink:href="#icon-remove">'}} />
                {editState}
            </div>
        </div>

