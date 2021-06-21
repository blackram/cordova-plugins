//
//  ViewController.m
//  uikit with objective c
//
//  Created by Russell Stitt on 16/6/21.
//

#import "SpaViewController.h"
#import "SpaPlugin.h"
#import <WebKit/WebKit.h>

@interface SpaViewController ()

@end

@implementation SpaViewController

WKWebView *webView2;
SpaViewResultDelegate *completionHandler;

- (void)setCompletionHandler(completion: *SpaViewResultDelegate){
    completionHandler = completion;
}

- (void)loadView {
    [super loadView];
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    theConfiguration.preferences = [[WKPreferences alloc] init];
    theConfiguration.preferences.javaScriptEnabled = true;
    
    webView2 = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
   
    webView2.navigationDelegate = self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    // example of loading an external url
    
    NSURL *nsurl=[NSURL URLWithString:@"https://www.google.com.au"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webView2 loadRequest:nsrequest];
     */
    
    NSString *siteRoot = @"www/sites/o2";
    NSURL *baseURL = [[NSBundle mainBundle] resourceURL];
    NSURL *siteURL = [baseURL URLByAppendingPathComponent:siteRoot];
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory: siteRoot];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [webView2 loadHTMLString:htmlString baseURL: siteURL];
    webView2.allowsBackForwardNavigationGestures = true;
    
    [self.view addSubview:webView2];
}

- (void) completed {

    // check for a callback and if present call it with a result when available

    if (completionHandler) {
        completionHandler();
    }
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *host = navigationAction.request.URL.host;
    NSString *path = navigationAction.request.URL.path;
    
    WKNavigationActionPolicy result = WKNavigationActionPolicyAllow;
    
    // can filter urls and restrict to local only if required
    
    if (host != nil) {
        if ([host containsString:@"www.ato.gov.au"] ) {
            result = WKNavigationActionPolicyCancel;
        } else {
            result = WKNavigationActionPolicyAllow;
        }
    } else {
        if ([path containsString:@"toolkit"]) { // detect a custom url with some meta info and extract member id
            result = WKNavigationActionPolicyCancel;
            [self dismissViewControllerAnimated:YES completion: ^{ [self completed]; }];
        }
    }
        
    decisionHandler(result);
}


@end
