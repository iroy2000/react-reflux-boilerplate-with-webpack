Reflux = require('reflux')
EventActions = require('../actions/EventActions')
LocalStorageUtil =  require('../utils/LocalStorage')
_ = require 'lodash'

key = 'sample-events'

expire_day = 2

module.exports = Reflux.createStore
    listenables: [EventActions]
    mixins: [LocalStorageUtil]
    selectedStatus: 'active'

    __activeFilter: (items) ->
        now = Date.now()

        return _.filter(items, (item) ->
            item.expire? and (now - item.expire)/86400000 < expire_day
        );

    __expireFilter: (items) ->
        now = Date.now()

        return _.filter(items, (item) ->
            !item.expire or (now - item.expire)/86400000 > expire_day
        );
      
    onGet: (status = 'all') ->
        items = @get(key)

        @selectedStatus = status

        if status == 'active'

            result = @__activeFilter(items)

            @trigger result

            return false

        if status == 'expire'
            result = @__expireFilter(items)

            @trigger result

            return false

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

            if @selectedStatus == 'active'
                result = @__activeFilter(result)

            if @selectedStatus == 'expire'
                result = @__expireFilter(result)

            @trigger result
