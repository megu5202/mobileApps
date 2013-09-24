//
//  MADViewController.m
//  Browser
//
//  Created by Melissa on 9/24/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //set the controller as the delegate of the UIWebView instance
    _webView.delegate = self;
    [self loadWebPageWithString: @"http://redwood.colorado.edu/apierce/mad/fall13"];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWebPageWithString:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString: urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error loading web page" message:[error localizedDescription] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (IBAction)bookmarkTapped:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"ATLAS", @"TAM", @"CU", nil];
    [actionSheet showFromToolbar:_toolbar];
    
}

- (void)actionSheet: (UIActionSheet *) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self loadWebPageWithString: @"http://atlas.colorado.edu"];
    }
    else if (buttonIndex == 1){
        [self loadWebPageWithString: @"http://tam.colorado.edu"];
    }
    else if (buttonIndex == 2){
        [self loadWebPageWithString: @"http://www.colorado.edu"];
    }

}

- (void) webViewDidStartLoad:(UIWebView *)webView{
    [_spinner startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    [_spinner stopAnimating];
}

@end
