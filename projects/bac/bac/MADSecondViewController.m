//
//  MADSecondViewController.m
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADSecondViewController.h"
#import "MADTabViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)updateLabels{
    NSLog(@"MADSecondViewController - updateLabels");
    //calculate the current BAC
    [(MADTabViewController*)self.tabBarController updateBAC];
    
    //get all the data from storage
    NSInteger gender = [(MADTabViewController*)self.tabBarController getGender];
    double weight = [(MADTabViewController*)self.tabBarController getWeight];
    double age = [(MADTabViewController*)self.tabBarController getAge];
    double drinks = [(MADTabViewController*)self.tabBarController getDrinkCount];
    double hours = [(MADTabViewController*)self.tabBarController getHours];
    float bac = [(MADTabViewController*)self.tabBarController getBAC];
    NSString *drunkenness = [(MADTabViewController*)self.tabBarController getDrunkenness];
    
    //fill in values
    _genderOut.text = [NSString stringWithFormat:@"%d", gender];
    _weightOut.text = [NSString stringWithFormat:@"%.3f", weight];
    _ageOut.text = [NSString stringWithFormat:@"%.3f", age];
    _drinkCountOut.text = [NSString stringWithFormat:@"%.3f", drinks];
    _hoursOut.text = [NSString stringWithFormat:@"%.3f", hours];
    
    if (bac > 1.0) _bacOut.text = [NSString stringWithFormat:@"%.3f", 1.000];
    else if (bac < 0.0) _bacOut.text = [NSString stringWithFormat:@"%.3f", 0.000];
    else _bacOut.text = [NSString stringWithFormat:@"%.3f", bac];
    
    _drunkennessOut.text = drunkenness;
}

/* first time this view is loaded after the app starts */
- (void)viewDidLoad{
    //NSLog(@"MADSecondViewController - viewDidLoad");
    [super viewDidLoad];
}

/* every time this view is loaded */
-(void)viewWillAppear:(BOOL)animated{
    //NSLog(@"MADSecondViewController - viewWillAppear");
    [self updateLabels];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
