//
//  MADViewController.h
//  demo1
//
//  Created by Melissa on 9/9/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
