cordova.define("rs-plugin-echo.EchoPlugin", function(require, exports, module) {
var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'EchoPlugin', 'coolMethod4', [arg0]);
};

});
