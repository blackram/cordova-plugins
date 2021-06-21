/********* SpaPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "SpaViewController.h"

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

    
    SpaViewController *newController = [SpaViewController new];
    
    /* 
    
    this piece is where the controller gets presented but is not working 

    may be easier to just set the view directly on the plugin

    self.viewController.navigationController?.push(
    [self.viewController addChildViewController: ];
    */
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
