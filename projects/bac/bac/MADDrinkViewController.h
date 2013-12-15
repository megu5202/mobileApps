//
//  MADDrinkViewController.h
//  bac
//
//  Created by Melissa on 12/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDrinkViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *drinkName;
@property (weak, nonatomic) IBOutlet UILabel *drinkABV;
@property (weak, nonatomic) IBOutlet UILabel *drinkDetails;
- (IBAction)drinkButton:(id)sender;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *ABV;
@property (copy, nonatomic) NSString *details;
@end
