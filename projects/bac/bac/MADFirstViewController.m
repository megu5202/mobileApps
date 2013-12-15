//
//  MADFirstViewController.m
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADFirstViewController.h"
#import "MADTabViewController.h"

@interface MADFirstViewController ()

@end

@implementation MADFirstViewController

- (void) sendAlert:(NSString *) alertTitle : (NSString *) alertMessage{
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle: alertTitle
                              message: alertMessage
                              delegate:self
                              cancelButtonTitle: @"Ok"
                              otherButtonTitles: nil];
    [alertView show];
}

- (void)sendDataToTabViewController{
    //NSLog(@"MADFirstViewController - sendDataToTabViewController");
    //get data from entry fields
    NSInteger gender = _genderSelector.selectedSegmentIndex;
    double weight = [_weightField.text doubleValue];
    double age = [_ageField.text doubleValue];
    
    //warn under 21 year olds
    if (age > 0 && age < 21){
        [self sendAlert:@"Watch Yourself" : @"The creator of this application is not to be held responsible for any illegal actions you participate in."];
    }
    //check that someone isnt making a stupid weight
    if (weight > 0 && weight < 25){
        [self sendAlert:@"Error" : @"I think you weigh more than that..."];
        _weightField.text = @"";
    }
    if (weight > 0 && weight > 400){
        [self sendAlert:@"Error" : @"You can't seriously weigh that much..."];
        _weightField.text = @"";
    }
    
    //update data:
    [(MADTabViewController*)self.tabBarController updateStats:gender :weight :age];
    [(MADTabViewController*)self.tabBarController updateBAC];
    double bac = [(MADTabViewController*)self.tabBarController getBAC];
    [(MADTabViewController*)self.tabBarController updateDrunkenness: bac];
}


/* ******************
   These following three methods:
   - Are called when any field is modified
   - Send the data to the tab view controller
   ****************** */
/* called when background is tapped */
- (void)dismissKeyboard{
    [_weightField resignFirstResponder];
    [_ageField resignFirstResponder];
    [self sendDataToTabViewController];
}

/* called when "DONE" button is pressed in keyboard */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self sendDataToTabViewController];
    return NO;
}

/* called whenever the gender is changed */
- (IBAction)changeGender:(UISegmentedControl *)sender {
    [self sendDataToTabViewController];
}


- (void)viewDidLoad{
    //NSLog(@"MADFirstViewController - viewDidLoad");
    [super viewDidLoad];
    //hook up background tap to dismiss keyboard function
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget: self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [_weightField setDelegate:self];
    [_ageField setDelegate:self];
    
    //selected segment must be default 0 should be not selected before anything happens
    _genderSelector.selectedSegmentIndex = -1;
    
    //[self sendAlert: @"Welcome!": @"Welcome to the Blood Alcohol Content Calculator! Enter your stats to begin, then add drinks and check your BAC!"];
}

- (void)viewWillAppear:(BOOL)animated{
    //NSLog(@"MADFirstViewController - viewWillAppear");
    // The following makes sure the settings persist even when we switch between tab views:
    double weight = [(MADTabViewController*)self.tabBarController getWeight];
    double age = [(MADTabViewController*)self.tabBarController getAge];
    NSInteger gender = [(MADTabViewController*)self.tabBarController getGender];
    
    //if a value has not yet been stored, keep the default value - else use the stored value
    if (gender == -1) _genderSelector.selectedSegmentIndex = -1;
    else _genderSelector.selectedSegmentIndex = gender;
    
    if (weight == 0) _weightField.text = @"";
    else _weightField.text = [NSString stringWithFormat:@"%.0f", weight];
    
    if (age == 0) _ageField.text = @"";
    else _ageField.text = [NSString stringWithFormat:@"%.0f", age];
}

- (void)viewWillDisappear:(BOOL)animated{
    //NSLog(@"MADFirstViewController - viewWillDisappear");
    BOOL goodData = [(MADTabViewController*)self.tabBarController checkData];
    if (!goodData) return; //send me back to this screen, then be done!
}

- (void)didReceiveMemoryWarning{
    //NSLog(@"MADFirstViewController - didReveiveMemoryWarning");
    [super didReceiveMemoryWarning];
}

@end
