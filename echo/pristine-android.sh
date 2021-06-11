 [ -d 'host' ] && rm -r host
 cordova create host au.com.rs.host Host
 cd host
 cordova platform add android
 cordova plugin add --link ../plugin/EchoPlugin
 cordova build android
 cordova requirements
 cp www/js/index.js www/js/index.js.bak

 cd ..
 cp index-demo.js host/www/js/index.js

