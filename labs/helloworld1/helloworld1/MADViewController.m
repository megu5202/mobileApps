//
//  MADViewController.m
//  helloworld1
//
//  Created by Melissa on 8/29/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"  //implementation (".m") files must always import their header file

@interface MADViewController ()
    //constructor
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
    _messageText.text = @"Hello World!";
}

@end
