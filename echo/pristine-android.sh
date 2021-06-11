 [ -d 'host' ] && rm -r host
 cordova create host au.com.rs.host Host
 cd host
 cordova platform add android
 #git checkout www
 cordova plugin add --link ../plugin/EchoPlugin
 cordova build android
 cordova requirements