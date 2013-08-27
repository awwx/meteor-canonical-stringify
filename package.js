Package.describe({
  summary: "stringify JSON objects with keys in sorted order"
});

Package.on_use(function(api) {
  api.use('underscore', ['client', 'server']);
  api.export('stringify', ['client', 'server']);
  api.add_files('stringify.js', ['client', 'server']);
});

Package.on_test(function(api) {
  api.use([
    'canonical-stringify',
    'coffeescript',
    'random',
    'tinytest'
  ]);
  api.add_files('stringify-tests.coffee', ['client', 'server']);
});
