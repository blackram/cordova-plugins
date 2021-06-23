var exec = require('cordova/exec');

exports.repeat = function (arg0, success, error) {
    exec(success, error, 'EchoPlugin', 'coolMethod', [arg0]);
};
