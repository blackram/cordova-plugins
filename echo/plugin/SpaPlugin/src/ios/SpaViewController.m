//
//  ViewController.m
//  uikit with objective c
//
//  Created by Russell Stitt on 16/6/21.
//

#import "ViewController.h"
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
          
    NSURL *nsurl=[NSURL URLWithString:@"https://www.google.com.au"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webView2 loadRequest:nsrequest];
    [self.view addSubview:webView2];
    
  //  webView.load("https://www.google.com.au")
}


@end
