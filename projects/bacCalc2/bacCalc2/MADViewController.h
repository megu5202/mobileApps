//
//  MADViewController.h
//  bacCalc2
//
//  Created by Melissa on 10/2/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
- (IBAction)genderChanged:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UITextField *weight;
- (IBAction)weightChanged:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UILabel *bacField;
@property (weak, nonatomic) IBOutlet UILabel *drunkStatus;

@property (weak, nonatomic) IBOutlet UILabel *drinks;
- (IBAction)decreaseDrinks:(UIButton *)sender;
- (IBAction)increaseDrinks:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *hours;
- (IBAction)decreaseHours:(UIButton *)sender;
- (IBAction)increaseHours:(UIButton *)sender;

- (IBAction)reset:(UIBarButtonItem *)sender;

- (IBAction)backgroundTap:(UIControl *)sender;
@end
