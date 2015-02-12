LocalStorage = {

  init: (prefix) ->
    @prefix = (prefix + "::") if not @prefix

  get: (key) ->
    try
      ret = @deserialize localStorage.getItem @prefix+key.toString()
    catch error
      @error error
    return ret or false

  set: (key, value) ->
    try
      localStorage.setItem @prefix+key.toString(), @serialize value
      ret = true 
    catch error
      @error error
    return ret or false

  list: () ->
    ret = []
    for i in [0..localStorage.length-1]
      try
        key = localStorage.key(i)
        if @prefix != ""
          if new RegExp("^#{@prefix}").test key
            ret.push key.replace new RegExp("^#{@prefix}"), ""
        else
          ret.push key
      catch error
        @error error
    return ret

  remove: (key) ->
    if localStorage.getItem(@prefix+key) is null
      callback false 
      return
    try
      localStorage.removeItem @prefix+key.toString()
      ret = true
    catch error
      @error error
    return ret or false

  serialize: (obj) -> 
    JSON.stringify obj

  deserialize: (json) ->
    JSON.parse json
}

module.exports = LocalStorage
