//
//  ViewController.m
//  TestWeb
//
//  Created by heyanzhi on 15/6/16.
//  Copyright (c) 2015年 heyanzhi. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSURL *url =[[NSBundle mainBundle]URLForResource:@"html2.html"
                                       withExtension:nil];
    NSMutableURLRequest *request =[NSMutableURLRequest
                                   requestWithURL:url
                                   cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3];
    _mainWebView.dataDetectorTypes = UIDataDetectorTypeLink;
    [_mainWebView loadRequest:request];
    _mainWebView.backgroundColor =[UIColor lightGrayColor];
    _mainWebView.hidden =YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
     [_mainWebView stringByEvaluatingJavaScriptFromString:@"test();"];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    NSString *host =request.URL.host;

    if ([host isEqualToString:@"ios"]) {
        NSLog(@"%@",host); 
        NSLog(@"%@",request.URL.lastPathComponent);
    }
    return YES;
}

- (void)reportUser {


   //NSString *str =[_mainWebView stringByEvaluatingJavaScriptFromString:@"reportUser(\'HomePage\');"];

    //[_mainWebView stringByEvaluatingJavaScriptFromString:@"alert(document.title);"];
    //NSString*str =[_mainWebView stringByEvaluatingJavaScriptFromString:@"getIOSAliInfo()"];
}

@end
