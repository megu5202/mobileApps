//
//  MADViewController.h
//  musicPicker
//
//  Created by Melissa on 10/3/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;

/* essentially global variables */
@property (strong, nonatomic) NSArray *genre;
@property (strong, nonatomic) NSArray *decade;


@end
