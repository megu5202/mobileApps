//
//  MADViewController.h
//  helloworld2
//
//  Created by Melissa on 9/3/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *messageText;


@end
