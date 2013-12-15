//
//  MADDrinkViewController.m
//  bac
//
//  Created by Melissa on 12/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADDrinkViewController.h"
#import "MADTabViewController.h"

@interface MADDrinkViewController ()

@end

@implementation MADDrinkViewController

- (void) sendAlert:(NSString *) alertTitle : (NSString *) alertMessage{
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle: alertTitle
                              message: alertMessage
                              delegate:self
                              cancelButtonTitle: @"Ok"
                              otherButtonTitles: nil];
    [alertView show];
}

- (void)sendDataToTabViewController: (double) drinksToAdd : (NSDate *) currentTime{
    [(MADTabViewController*)self.tabBarController updateDrinksAndHours:drinksToAdd :currentTime];
    [(MADTabViewController*)self.tabBarController updateBAC];
    double bac = [(MADTabViewController*)self.tabBarController getBAC];
    [(MADTabViewController*)self.tabBarController updateDrunkenness: bac];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    _drinkName.text = _name;
    _drinkABV.text = _ABV;
    _drinkDetails.text = _details;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drinkButton:(id)sender {
    //get the current time
    NSDate *now = [NSDate date];
    //send time, and 1 drink increase to updateData
    [self sendDataToTabViewController: 1 : now];
    //go back to add a drink screen or send an alert saying a drink was added
    [self sendAlert:@"Congrats!" :@"Drink was recorded"];
}
@end
