{canonicalStringify} = awwx

Tinytest.add 'canonical-stringify', (test) ->
  test.equal canonicalStringify({a: 1, b: 2}), '{"a":1,"b":2}'
  test.equal canonicalStringify({b: 2, a: 1}), '{"a":1,"b":2}'

  test.equal canonicalStringify({c: 3, a: 1, b: 2}), '{"a":1,"b":2,"c":3}'

  test.equal(
    canonicalStringify(
      [true, {b: [1, {y: "bar", x: "foo"}, 2], a: "baz"}, null]
    ),
    '[true,{"a":"baz","b":[1,{"x":"foo","y":"bar"},2]},null]'
  )

  test.equal(canonicalStringify(null), "null")

  test.equal(
    canonicalStringify(
      {a: 1, b: 2},
      null,
      2
    ),
    """
    {
      "a": 1,
      "b": 2
    }
    """
  )

  # Try a large number of keys to trigger a large hash
  # algorithm if some environment is doing something different with
  # small objects vs. large objects.

  # https://github.com/meteor/meteor/pull/1033
  random = if Random.create? then Random.create(0) else Random

  nKeys = 1000
  keys = []
  for i in [0...nKeys]
    keys.push random.id()

  o = {}
  for key in keys
    o[key] = true

  s = canonicalStringify(o)
  sKeys = _.map(s.match(/"\w+"/g), ((x) -> x.substr(1, x.length - 2)))
  test.equal sKeys.length, nKeys
  for i in [0...nKeys - 1]
    test.isTrue sKeys[i] < sKeys[i + 1]
