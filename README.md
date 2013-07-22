# Canonical stringify

`canonicalStringify(value, replacer, indent)`

A version of `JSON.stringify` which serializes objects with keys in
sorted order.

    canonicalStringify({a: 1, b: 2})  ->  "{"a":1,"b":2}"
    canonicalStringify({b: 2, a: 1})  ->  "{"a":1,"b":2}"

Thus if two objects are structurally equal, then their serialization
will be equal as well.


## Exports

With the Meteor linker, the package exports `canonicalStringify`.


In Meteor 0.6.4.1 and below, `canonicalStringify` is exported into the
global namespace.
