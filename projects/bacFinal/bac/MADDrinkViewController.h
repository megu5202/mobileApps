//
//  MADDrinkViewController.h
//  bac
//
//  Created by Melissa on 12/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface MADDrinkViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)drinkButton:(id)sender;

@property (copy, nonatomic) NSString *drinkType;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *ABV;
@property (copy, nonatomic) NSString *details;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
@end
