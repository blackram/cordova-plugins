/********* SpaPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "SpaPlugin.h"
#import "SpaViewController.h"

@implementation SpaPlugin

 - (void)pluginInitialize
 {
     NSDictionary* settings = self.commandDelegate.settings;
 }

NSString* _callbackId;


- (void)launchMethod:(CDVInvokedUrlCommand*)command
{
   CDVPluginResult* pluginResult = nil;
   NSString* echo = [command.arguments objectAtIndex:0];

    [self._callback] = command.callbackId;
    
    SpaViewController *newController = [SpaViewController new];
    newController.setCompletionHandler(^{[ self (^void)completed];});
  //  newController.modalPresentationStyle = UIModalPresentationFullScreen;

    [self.viewController addChildViewController:newController];
    [self.viewController.view addSubview:newController.view];
    [newController didMoveToParentViewController:self.viewController];
    
  // [self.viewController presentViewController:newController animated:YES completion:nil];
  
  // can send a preliminaruy result or nothing
  /*
   if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    */

   // [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
 
  
}

- (void)completed {
  // could accept a dictionary of results and forward as result
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"controller completed"];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end



