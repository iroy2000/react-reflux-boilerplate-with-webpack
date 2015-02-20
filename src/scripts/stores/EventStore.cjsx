Reflux = require('reflux')
EventActions = require('../actions/EventActions')
LocalStorageUtil =  require('../utils/LocalStorage')
_ = require 'lodash'

key = 'sample-events'

module.exports = Reflux.createStore
    listenables: [EventActions]
    mixins: [LocalStorageUtil]    
      
    onGet: ->
        items = @get(key)
        @trigger items

    onCreate: (item) ->
        items = @get(key)

        items = items || []
        items.push(item)
        @set(key, items)

        @trigger items

    onUpdate: (items) ->
        @set(key, items)
        @trigger items

    onDelete: (event) ->
        return false

    onSearch: (query) ->
        items = @get(key)
        result  = []

        if query == false
            @trigger items
        else
            result = _.filter(items, (item) ->

                item.name.toLowerCase().indexOf(query.toLowerCase()) > -1
            );

            @trigger result
