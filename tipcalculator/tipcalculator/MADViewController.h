//
//  MADViewController.h
//  tipcalculator
//
//  Created by Melissa on 9/19/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *checkAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipPercent;
@property (weak, nonatomic) IBOutlet UITextField *people;
@property (weak, nonatomic) IBOutlet UILabel *tipDue;
@property (weak, nonatomic) IBOutlet UILabel *totalDue;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPerson;

@end
