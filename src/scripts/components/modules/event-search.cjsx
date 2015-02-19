React = require 'react/addons'
EventActions = require '../../actions/EventActions'

module.exports = React.createClass
    mixins: [React.addons.LinkedStateMixin]

    onQueryChange:(e) ->
        e.preventDefault()

        query = @refs.query.getDOMNode().value

        EventActions.search query if query.length > 1

        EventActions.search false if query.length == 0

    render: ->
        return (
            <div className="autosuggest-component">
                <form className="autosuggest">
                    <input
                        name="query"
                        ref="query"
                        onChange={@onQueryChange}
                        placeholder="Search a Title" />
                </form>
            </div>
        )