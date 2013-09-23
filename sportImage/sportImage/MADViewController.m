//
//  MADViewController.m
//  sportImage
//
//  Created by Melissa on 9/10/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    if (sender.tag==1){
        _sportImage.image = [UIImage imageNamed:@"orioles.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"%@, the Orioles are bad", _nameField.text];
        _messageLabel.text = message;
    }
    if (sender.tag==2){
        _sportImage.image = [UIImage imageNamed:@"ravens.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"Gooooooo Ravens!", _nameField.text];
        _messageLabel.text = message;
    }
}

- (IBAction)textFieldDone:(UITextField *)sender {
    [sender resignFirstResponder];
}

@end
