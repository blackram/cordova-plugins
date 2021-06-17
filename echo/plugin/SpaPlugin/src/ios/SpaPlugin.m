/********* SpaPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "SpaWebViewController.h"

@interface SpaPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)launchMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation SpaPlugin

- (void)pluginInitialize
{
    NSDictionary* settings = self.commandDelegate.settings;
    
    

}

- (void)launchMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    
    SpaWebViewController *newController = [SpaWebViewController new];
    
    self.viewController.navigationController?.push(
    [self.viewController addChildViewController: ];
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
