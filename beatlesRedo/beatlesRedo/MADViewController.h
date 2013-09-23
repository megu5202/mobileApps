//
//  MADViewController.h
//  beatlesRedo
//
//  Created by Melissa on 9/17/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
- (IBAction)changeImage:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *capitalizeSwitch;
- (IBAction)updateFont:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;
- (IBAction)changeFontSize:(UISlider *)sender;


@end
