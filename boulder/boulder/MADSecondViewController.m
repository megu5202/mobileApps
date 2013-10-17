//
//  MADSecondViewController.m
//  boulder
//
//  Created by Melissa on 10/15/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)submitQuestion:(UIButton *)sender {
    //mailto syntax: mailto:first@example.com?cc=second@example.com,third@example.com& subject=something&body=the body
    //Mailto parameter should be preceded by “?” for the first or only parameter and “&” for second and subsequent parameter
    NSString *recipients = @"mailto:melissa.guba@colorado.edu?subject=Message from Boulder app";
    NSString *body = [NSString stringWithFormat:@"&body=%@ from %@ %@", _messageTextField.text, _nameTextField.text, _emailTextField.text];
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    NSLog(email);
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //returns a legal URL string 
    //opens the mail app 
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]]; 
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitMessage:(UIButton *)sender {
}
@end
