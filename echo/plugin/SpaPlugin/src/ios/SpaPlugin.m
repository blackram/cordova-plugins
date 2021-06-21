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
  //  newController.modalPresentationStyle = UIModalPresentationFullScreen;

    [self.viewController addChildViewController:newController];
    [self.viewController.view addSubview:newController.view];
    [newController didMoveToParentViewController:self.viewController];
    
  // [self.viewController presentViewController:newController animated:YES completion:nil];

    /*
   if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
 */
  
}

@end
