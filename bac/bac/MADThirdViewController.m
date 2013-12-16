//
//  MADThirdViewController.m
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADThirdViewController.h"
#import "MADTabViewController.h"

@interface MADThirdViewController ()

@end

@implementation MADThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)sendDataToTabViewController{
    double drinks = _drinkStepper.value;
    double hours = _hourStepper.value;
    [(MADTabViewController*)self.tabBarController updateDrinksAndHours:drinks :hours];
    [(MADTabViewController*)self.tabBarController updateBAC];
    double bac = [(MADTabViewController*)self.tabBarController getBAC];
    [(MADTabViewController*)self.tabBarController updateDrunkenness: bac];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    double drinks = [(MADTabViewController*)self.tabBarController getDrinks];
    double hours = [(MADTabViewController*)self.tabBarController getHours];
    
    if (drinks == 0) _drinksOut.text = @"0";
    else _drinksOut.text = [NSString stringWithFormat:@"%.0f", drinks];
    
    if (hours == 0) _hoursOut.text = @"0";
    else _hoursOut.text = [NSString stringWithFormat:@"%.0f", hours];
}

- (IBAction)drinksChanged:(UIStepper *)sender {
    _drinksOut.text = [NSString stringWithFormat:@"%.0f", _drinkStepper.value];
    [self sendDataToTabViewController];
}

- (IBAction)hoursChanged:(UIStepper *)sender {
    _hoursOut.text = [NSString stringWithFormat:@"%.0f", _hourStepper.value];
    [self sendDataToTabViewController];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self sendDataToTabViewController];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
