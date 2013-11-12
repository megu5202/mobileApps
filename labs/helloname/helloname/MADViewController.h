//
//  MADViewController.h
//  helloname
//
//  Created by Melissa on 9/3/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UILabel *messageField;

- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
