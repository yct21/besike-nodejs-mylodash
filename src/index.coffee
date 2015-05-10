
_ = {
  once: (fn) ->
    invoked = false
    result = undefined

    return ->
      if !invoked
        invoked = true
        result = fn()

      result

  memoize: (fn, cache_key) ->
    cache = {}

    (parameter) ->
      hash_key = parameter
      if cache_key != undefined
        hash_key = cache_key(parameter)

      if cache.hasOwnProperty(hash_key)
        cache[hash_key]
      else
        cache[hash_key] = fn(parameter)

  bind: (fn, context) ->
    ->
      fn.apply(context)
}

module.exports = _
