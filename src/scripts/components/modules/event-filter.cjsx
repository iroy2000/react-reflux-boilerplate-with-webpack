React = require('react/addons')
EventActions = require '../../actions/EventActions'

module.exports = React.createClass
    mixins: [React.addons.LinkedStateMixin]

    getInitialState: ->
        {
            selected : {
                active: true
            }
        }

    onShowAll: (e) ->
        e.preventDefault()

        EventActions.get('all')

        @setState({
            selected : {
                all: true
            }
        })


    onShowActive: (e) ->
        e.preventDefault()

        EventActions.get('active')

        @setState({
            selected : {
                active: true
            }
        })

    onShowExpire: (e) ->
        e.preventDefault()

        EventActions.get('expire')

        @setState({
            selected : {
                expire: true
            }
        })

    render: ->
        cx = React.addons.classSet

        showAllClass = cx({
            'option': true
            'active': @state.selected.all
        })

        showActiveClass = cx({
            'option': true
            'active': @state.selected.active
        })

        showExpireClass = cx({
            'option': true
            'active': @state.selected.expire
        })

        <div>
            <p className="tips">Tips: Notes created will be expired in 2 days</p>
            <ul className="filter">
                <li>Filter: </li>
                <li className={showAllClass} onClick={@onShowAll}>All</li>
                <li className={showActiveClass} onClick={@onShowActive}>Active</li>
                <li className={showExpireClass} onClick={@onShowExpire}>Expired</li>
            </ul>
        </div>
