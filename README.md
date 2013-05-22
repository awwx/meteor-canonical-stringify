# Canonical stringify

`canonicalStringify(value, replacer, indent)`

A version of `JSON.stringify` which serializes objects with keys in
sorted order.

    canonicalStringify({a: 1, b: 2})  ->  "{"a":1,"b":2}"
    canonicalStringify({b: 2, a: 1})  ->  "{"a":1,"b":2}"

Thus if two objects are structurally equal, then their serialization
will be equal as well.


## Exports

`canonicalStringify` is exported into the global namespace as
`awwx.canonicalStringify`.  From your own code you can use
`awwx.canonicalStringify` directly:

```
var serialized = awwx.canonicalStringify(obj);
```

or if you prefer you can "import" the function simply by assigning it
to a variable:

```
var canonicalStringify = awwx.canonicalStringify;

...

var serialized = canonicalStringify(obj);
```
