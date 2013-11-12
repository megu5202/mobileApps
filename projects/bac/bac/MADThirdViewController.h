//
//  MADThirdViewController.h
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADThirdViewController : UIViewController

- (IBAction)drinksChanged:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UIStepper *drinkStepper;
@property (weak, nonatomic) IBOutlet UILabel *drinksOut;

- (IBAction)hoursChanged:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UIStepper *hourStepper;
@property (weak, nonatomic) IBOutlet UILabel *hoursOut;

@end
