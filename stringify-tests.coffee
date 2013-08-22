Tinytest.add 'canonical-stringify', (test) ->
  test.equal stringify({a: 1, b: 2}), '{"a":1,"b":2}'
  test.equal stringify({b: 2, a: 1}), '{"a":1,"b":2}'

  test.equal stringify({c: 3, a: 1, b: 2}), '{"a":1,"b":2,"c":3}'

  test.equal(
    stringify(
      [true, {b: [1, {y: "bar", x: "foo"}, 2], a: "baz"}, null]
    ),
    '[true,{"a":"baz","b":[1,{"x":"foo","y":"bar"},2]},null]'
  )

  test.equal(stringify(null), "null")

  test.equal(
    stringify(
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

  random = Random.create(0)

  nKeys = 1000
  keys = []
  for i in [0...nKeys]
    keys.push random.id()

  o = {}
  for key in keys
    o[key] = true

  s = stringify(o)
  sKeys = _.map(s.match(/"\w+"/g), ((x) -> x.substr(1, x.length - 2)))
  test.equal sKeys.length, nKeys
  for i in [0...nKeys - 1]
    test.isTrue sKeys[i] < sKeys[i + 1]
