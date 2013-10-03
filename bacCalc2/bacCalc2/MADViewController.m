//
//  MADViewController.m
//  bacCalc2
//
//  Created by Melissa on 10/2/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

/*
 PROBLEM: if i start the app and just enter weight, 
 or just enter gender, I don't want to be warned until
 I try to change the drinks/hours.
*/

@implementation MADViewController

- (void)viewDidLoad{
    //make sure neither gender is selected at first
    _gender.selectedSegmentIndex = -1;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) sendAlert:(NSString *) alertMessage{
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle: @"Error"
                              message: alertMessage
                              delegate:self
                              cancelButtonTitle: @"Ok"
                              otherButtonTitles: nil];
    [alertView show];
}

- (void) resetFunc{
    _drinks.text = @"0";
    _hours.text = @"0";
    _bacField.text = @"0.000";
    _drunkStatus.text = @"";
}

- (BOOL) checkData{
    double weight = [_weight.text doubleValue];
    if (_gender.selectedSegmentIndex == -1){
        if (1 < weight < 500){
            [self sendAlert:@"Please select your gender."];
            [self resetFunc];
            return FALSE;
        }
        else{
            [self sendAlert:@"Please select your gender and enter your weight."];
            [self resetFunc];
            return FALSE;
        }
    }
    else if (1 < weight || weight < 500){
        [self sendAlert:@"Please enter your weight."];
        [self resetFunc];
        return FALSE;
    }
    return TRUE;
}

- (void) calculateBAC{
    double genderConst = 0.00;
    double weight = [_weight.text doubleValue];
    double drinks = [_drinks.text doubleValue];
    double hours = [_hours.text doubleValue];
    
    //make sure required input has been entered.
    if (drinks != 0 || hours != 0){
        if (_gender.selectedSegmentIndex == -1 && weight == 0){
            [self sendAlert:@"Please select your gender and enter your weight."];
            [self resetFunc];
            return;
        }
        else if (_gender.selectedSegmentIndex == -1){
            [self sendAlert:@"Please enter your weight."];
            [self resetFunc];
            return;
        }
        else if (weight == 0){
            [self sendAlert:@"Please select your gender."];
            [self resetFunc];
            return;
        }
    }
    
    /* set gender */
    if (_gender.selectedSegmentIndex == 0) {
        genderConst = 0.68;
    }
    else if (_gender.selectedSegmentIndex == 1){
        genderConst = 0.55;
    }
    
    /* check and set weight */
    if (weight < 1 || weight > 500){
        [self sendAlert:@"Please enter a valid weight in lbs."];
        _weight.text = @"";
        return;
    }
    
    
    
    double currentBac = drinks * 6 * 1.055/weight * genderConst - (0.015 * hours);
    if (currentBac < 0) currentBac = 0;
    else if (currentBac == 0) _drunkStatus.text = @"Sober as a bird";
    else if (0 < currentBac < 0.03) _drunkStatus.text = @"Cheers to alcohol!";
    else if (0.03 <= currentBac < 0.06) _drunkStatus.text = @"You're in the zone";
    else if (0.06 <= currentBac < 0.08) _drunkStatus.text = @"Feelings of invincibility common.";
    else if (0.08 <= currentBac < 0.1) _drunkStatus.text = @"Over the legal driving limit!";
    else if (0.1 <= currentBac < 0.2) _drunkStatus.text = @"You're drunk, at risk of alcohol poisoning, and should not drive!";
    else if (0.2 <= currentBac < 0.3) _drunkStatus.text = @"You could black out at any time, and should not drive!";
    else if (0.3 <= currentBac < 0.4) _drunkStatus.text = @"You're either unconscious or an alcoholic. Don't drive.";
    else {
        currentBac = 1;
        _drunkStatus.text = @"So ridiculously dead...";
    }
    _bacField.text = [NSString stringWithFormat:@"%.3f", currentBac];
}
    

- (IBAction)genderChanged:(UISegmentedControl *)sender {
    [self calculateBAC];
}
- (IBAction)weightChanged:(UITextField *)sender {
    [self calculateBAC];
}


- (IBAction)decreaseDrinks:(UIButton *)sender {
    int drinks = [_drinks.text doubleValue];
    drinks = drinks - 1;
    if (drinks <= 0 || drinks > 65) _drinks.text = @"0";
    else _drinks.text = [NSString stringWithFormat:@"%d", drinks];
    if ([self checkData]) [self calculateBAC];
}
- (IBAction)increaseDrinks:(UIButton *)sender {
    int drinks = [_drinks.text doubleValue];
    drinks = drinks + 1;
    if (drinks <= 0 || drinks > 65) _drinks.text = @"0";
    else _drinks.text = [NSString stringWithFormat:@"%d", drinks];
    if ([self checkData]) [self calculateBAC];
}


- (IBAction)decreaseHours:(UIButton *)sender {
    int hours = [_hours.text doubleValue];
    hours = hours - 1;
    if (hours <= 0 || hours > 24) _hours.text = @"0";
    else _hours.text = [NSString stringWithFormat:@"%d", hours];
    if ([self checkData]) [self calculateBAC];
}
- (IBAction)increaseHours:(UIButton *)sender {
    int hours = [_hours.text doubleValue];
    hours = hours + 1;
    if (hours <= 0 || hours > 24) _hours.text = @"0";
    else _hours.text = [NSString stringWithFormat:@"%d", hours];
    if ([self checkData]) [self calculateBAC];
}


- (IBAction)reset:(UIBarButtonItem *)sender {
    [self resetFunc];
}

//make keyboard disappear as it was called by these text fields when the background is tapped
- (IBAction)backgroundTap:(UIControl *)sender {
    [self.weight resignFirstResponder];
    [self.drinks resignFirstResponder];
    [self.hours resignFirstResponder];
}
//make keyboard disappear when return is pressed
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
