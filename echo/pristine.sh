 [ -d 'host' ] && rm -r host
 cordova create host au.com.rs.host Host
 cd host
 cordova platform add android
 cordova platform add ios
 cordova plugin add --link ../plugin/EchoPlugin
 cordova plugin add --link ../plugin/SpaPlugin
 cp www/js/index.js www/js/index.js.bak

 cd ..
 cp index-demo.js host/www/js/index.js

 cd host
 cordova build android
 cordova build ios
 cordova requirements

 cd ..
