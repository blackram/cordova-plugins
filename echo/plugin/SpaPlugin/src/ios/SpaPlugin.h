#import <Cordova/CDV.h>

@interface SpaPlugin : CDVPlugin<SpaViewResultDelegate> {
  // Member variables go here.
}

- (void)launchMethod:(CDVInvokedUrlCommand*)command;

@end


@protocol SpaViewResultDelegate
@optional
- (void) completed;
@end
