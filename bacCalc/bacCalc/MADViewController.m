//
//  MADViewController.m
//  bacCalc
//
//  Created by Melissa on 9/28/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _weight.delegate = self;
    _drinks.delegate = self;
    _hours.delegate = self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

- (void) updateBac{
    /* get user input */
    double genderConst = 0;
    double weight = [_weight.text doubleValue];
    int drinks = [_drinks.text intValue];
    int hours = [_hours.text intValue];
    
    /* set gender constant and error check gender input */
    if ([_genderPicker isEnabledForSegmentAtIndex:0]){
        genderConst = 0.68;
    }
    else if ([_genderPicker isEnabledForSegmentAtIndex:1]){
        genderConst = 0.55;
    }

    
    /* error check weight input */
    if (weight < 10){
        [self sendAlert:@"You weigh more than that."];
        _weight.text = @"";
    }
    else if (weight > 500){
        [self sendAlert:@"You don't weigh that much."];
        _weight.text = @"";
    }
    
    /* calculate BAC based on given inputs */
    double currentBac = drinks * 6 * 1.055/weight * genderConst - (0.015 * hours);
    
    if (currentBac < 0) {
        currentBac = 0;
    }
    else if (currentBac > 1) {
        [self sendAlert: @"You are dead."];
        _drinks.text = @"";
        currentBac = 0;
        [self updateBac];
    }
    
    //format the style to a decimal
    NSNumberFormatter *decimalFormatter = [[NSNumberFormatter alloc] init];
    [decimalFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    _bac.text = [decimalFormatter stringFromNumber: [NSNumber numberWithDouble: currentBac] ];
}

- (IBAction)calculate:(UIButton *)sender {
    //if there is a missing entry, error
    //else update bac!
    [self updateBac];
}

- (IBAction)reset:(UIButton *)sender {
    _weight.text = @"";
    _drinks.text = @"";
    _hours.text = @"";
    _bac.text = @"";
}

//when we press the plus and minus buttons the drinks increase or decrease
- (IBAction)drinkStep:(UIStepper *)sender {
    [_drinks setText:[NSString stringWithFormat:@"%d", (int)[sender value]]];
    [self updateBac];
}
//when we press the plus and minus buttons the hours increase or decrease
- (IBAction)hourStep:(UIStepper *)sender {
    [_hours setText:[NSString stringWithFormat:@"%d", (int)[sender value]]];
    [self updateBac];

}

//to be done typing...
- (void) textFieldDidEndEditing:(UITextField *) textField{
    [self updateBac];
}

//when the user touches off of the keyboard, it disappears
- (IBAction)backgroundTap:(id)sender{
    [self.weight resignFirstResponder];
    [self.drinks resignFirstResponder];
    [self.hours resignFirstResponder];
}
@end
