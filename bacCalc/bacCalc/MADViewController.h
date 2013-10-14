//
//  MADViewController.h
//  bacCalc
//
//  Created by Melissa on 9/28/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UITextFieldDelegate, UIAlertViewDelegate>

//text field entry
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderPicker;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *drinks;
- (IBAction)drinkStep:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UITextField *hours;
- (IBAction)hourStep:(UIStepper *)sender;


//result label
@property (weak, nonatomic) IBOutlet UILabel *bac;

//allows user to tap the background to get rid of keyboard
- (IBAction)backgroundTap:(id)sender;

- (IBAction)calculate:(UIButton *)sender;
- (IBAction)reset:(UIButton *)sender;

-(void)updateBac;

@end
