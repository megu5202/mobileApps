//
//  MADTabViewController.m
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADTabViewController.h"

@interface MADTabViewController ()

@end

@implementation MADTabViewController

- (void) sendAlert:(NSString *) alertTitle : (NSString *) alertMessage{
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle: alertTitle
                              message: alertMessage
                              delegate:self
                              cancelButtonTitle: @"Ok"
                              otherButtonTitles: nil];
    [alertView show];
    // *********** if alert title is "error" - make first view appear!
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    //NSLog(@"MADTabViewController - initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // m: not sure why this didnt actually initialize anything?
    }
    return self;
}

- (void)viewDidLoad{
    //NSLog(@"MADTabViewController - viewDidLoad");
    [super viewDidLoad];
    gender = -1;
    weight = 0;
    age = 0;
    drinks = 0;
    hours = 0;
    goodData = FALSE;
    bac = 0;
    drunkenness = @"";
}

- (NSInteger)getGender{ return gender; }
- (double)getWeight{ return weight; }
- (double)getAge{ return age; }
- (double)getDrinks{ return drinks; }
- (double)getHours{ return hours; }
- (float)getBAC{ return bac; }
- (NSString*)getDrunkenness{ return drunkenness; }

- (BOOL)checkForData{
    //NSLog(@"MADTabViewController - checkForData");
    if (gender == -1) return FALSE;
    else if (weight == 0) return FALSE;
    else if (age == 0) return FALSE;
    else return TRUE;
}
- (BOOL)checkWeight{
    //NSLog(@"MADTabViewController - checkWeight");
    if (weight > 500 || weight < 10) return FALSE;
    else return TRUE;
}
- (BOOL)checkAge{
    //NSLog(@"MADTabViewController - checkAge");
    if (age > 150 || age < 0) return FALSE;
    else return TRUE;
}
- (BOOL)checkData{
    NSLog(@"MADTabViewController - checkData");
    //first check if all of the data has been entered...
    BOOL isData = self.checkForData;
    if (!isData) {
        [self sendAlert:@"Error" : @"Please enter valid stats in the Settings Page."];
        return FALSE;
    }
    //then check if that data is correct
    else {
        BOOL validWeight = self.checkWeight;
        BOOL validAge = self.checkAge;
        
        if (!validWeight && !validAge){
            [self sendAlert:@"Error" : @"Please enter a valid weight and age."];
            return FALSE;
        }
        else if (!validWeight){
            [self sendAlert:@"Error" : @"Please enter a valid weight."];
            return FALSE;
        }
        else if (!validAge){
            [self sendAlert:@"Error" : @"Please enter a valid age."];
            return FALSE;
        }
        else {
            goodData = TRUE;
            return TRUE;
        }
    }
}

- (void)updateDrunkenness: (double)currentBac{
    if (currentBac == 0) drunkenness = @"Sober as a bird";
    else if (0.02 < currentBac < 0.03) drunkenness = @"Cheers to alcohol!";
    else if (0.03 <= currentBac < 0.06) drunkenness = @"You're in the zone";
    else if (0.06 <= currentBac < 0.08) drunkenness = @"Feelings of invincibility common.";
    else if (0.08 <= currentBac < 0.1) drunkenness = @"Over the legal driving limit!";
    else if (0.1 <= currentBac < 0.2) drunkenness = @"You're drunk, at risk of alcohol poisoning, and should not drive!";
    else if (0.2 <= currentBac < 0.3) drunkenness = @"You could black out at any time, and should not drive!";
    else if (0.3 <= currentBac < 0.4) drunkenness = @"You're either unconscious or an alcoholic. Don't drive.";
    else drunkenness = @"So ridiculously dead...";
}

- (void)updateBAC{
    NSLog(@"MADTabViewController - updateBAC");
    /* if the data is good, calculate the bac */
    if (goodData){
        //get gender constant (at this point the data has been checked so gender must be either 0 or 1
        double genderConstant = -1;
        if (gender == 0) genderConstant = 0.55;
        if (gender == 1) genderConstant = 0.68;
    
        bac = drinks * 6 * 1.055/weight * genderConstant - (0.015 * hours);
    }
    else{
        bac = 0;
    }
}

- (void)updateStats: (NSInteger)newGender : (double)newWeight : (double)newAge{
    NSLog(@"MADTabViewController - updateStats");
    gender = newGender;
    weight = newWeight;
    age = newAge;
}

- (void) updateDrinksAndHours:(double)newDrinks :(double)newHours{
    NSLog(@"MADTabViewController - updateDrinksAndHours");
    drinks = newDrinks;
    hours = newHours;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
