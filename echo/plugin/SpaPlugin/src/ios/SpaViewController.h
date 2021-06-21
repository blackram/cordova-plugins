//
//  ViewController.h
//  uikit with objective c
//
//  Created by Russell Stitt on 16/6/21.
//

#import <WebKit/WebKit.h>
#import "SpaPlugin.h"

@interface SpaViewController : UIViewController<WKNavigationDelegate>

- (void) setCompletionHandler(completion: SpaViewResultDelegate);

@end

