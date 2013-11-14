//
//  MADViewController.h
//  animation
//
//  Created by Melissa on 11/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliderMoved:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@end
