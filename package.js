Package.describe({
  summary: "stringify JSON objects with keys in sorted order"
});

Package.on_use(function(api) {
  return api.add_files('stringify.js', ['client', 'server']);
});

Package.on_test(function(api) {
  api.use(['coffeescript', 'canonical-stringify']);
  return api.add_files('stringify-tests.coffee', ['client', 'server']);
});
