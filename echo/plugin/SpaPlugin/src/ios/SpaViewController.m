//
//  ViewController.m
//  uikit with objective c
//
//  Created by Russell Stitt on 16/6/21.
//

#import "SpaViewController.h"
#import <WebKit/WebKit.h>

@interface SpaViewController ()

@end

@implementation SpaViewController

WKWebView *webView2;

- (void)loadView {
    [super loadView];
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
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
               
    [self.view addSubview:webView2];
    
  //  webView.load("https://www.google.com.au")
}


@end
