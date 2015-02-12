Reflux = require('reflux')
EventActions = require('../actions/EventActions')
LocalStorageUtil =  require('../utils/LocalStorage')
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
