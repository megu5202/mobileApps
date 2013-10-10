//
//  MADViewController.m
//  favorites
//
//  Created by Melissa on 10/10/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _user = [[Favorite alloc] init];
}

-(void)viewWillAppear:(BOOL)animated{
    _bookLabel.text = _user.favBook;
    _authorLabel.text = _user.favAuthor;
}

-(IBAction)returned:(UIStoryboardSegue *)segue {
    _bookLabel.text = _user.favBook;
    _authorLabel.text = _user.favAuthor;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
