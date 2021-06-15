var exec = require('cordova/exec');

/* leave the arg as mahy want to pass info to the plugin */
exports.launch = function (arg0, success, error) {
    exec(success, error, 'SpaPlugin', 'launch', [arg0]);
};
