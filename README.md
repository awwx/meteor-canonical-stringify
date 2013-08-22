# Canonical stringify

`stringify(value, replacer, indent)`

A version of `JSON.stringify` which serializes objects with keys in
sorted order.

    stringify({a: 1, b: 2})  ->  '{"a":1,"b":2}'
    stringify({b: 2, a: 1})  ->  '{"a":1,"b":2}'

Thus if two objects are structurally equal, then their serialization
will be equal as well.

This allows objects to be used as keys:

    key1 = {a: 1, b: 2};
    key2 = {b: 2};

    o = {};
    o[stringify(o1)] = "a and b";
    o[stringify(o2)] = "just b";

## Version

1.2

Supports Meteor 0.6.5 and later.


## Support

If you find this package useful,
[donate](https://www.gittip.com/awwx/) to support its ongoing
maintenance and development... and avoid the dreaded **dead package
syndrome**!  :-)

Not sure what to give? While the amount is entirely up to you, a
weekly contribution of $1 is useful if you're relying on this package
for something important.  25&cent; is a cool amount for a personal
contribution.

Thank you!
