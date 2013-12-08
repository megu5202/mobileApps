//
//  MADSecondViewController.h
//  boulder
//
//  Created by Melissa on 10/15/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *messageTextField;
- (IBAction)submitMessage:(UIButton *)sender;

@end
