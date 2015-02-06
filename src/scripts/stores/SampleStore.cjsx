Reflux = require('reflux')
SampleActions = require('../actions/SampleActions')

module.exports = Reflux.createStore
    listenables: [SampleActions]
    
    onGreeting: (name) ->
        if(!name) 
            @trigger({
                msg: "Where is your name ??"
            })
            return false
        
        @count = @count || 0
        @count++
        @trigger({
            msg: "Hello " + name
            note: "This message is processed in Store and has been called " + @count + " times !"
        })
