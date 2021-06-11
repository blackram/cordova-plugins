cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "rs-plugin-echo.EchoPlugin",
      "file": "plugins/rs-plugin-echo/www/EchoPlugin.js",
      "pluginId": "rs-plugin-echo",
      "clobbers": [
        "cordova.plugins.EchoPlugin"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova-plugin-whitelist": "1.3.4",
    "rs-plugin-echo": "0.0.3"
  };
});