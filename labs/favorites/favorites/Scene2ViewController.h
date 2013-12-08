//
//  Scene2ViewController.h
//  favorites
//
//  Created by Melissa on 10/10/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"
#import "MADViewController.h"

@interface Scene2ViewController : UIViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userBook;
@property (weak, nonatomic) IBOutlet UITextField *userAuthor;
@property (strong, nonatomic) Favorite *userInfo;

@end

@interface InfoViewController : UIViewController
<UITextFieldDelegate>

@end
