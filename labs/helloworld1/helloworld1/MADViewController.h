//
//  MADViewController.h
//  helloworld1
//
//  Created by Melissa on 8/29/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h> //imports the UI framework, i.e. UIViewController (super class)

@interface MADViewController : UIViewController //defines what the interface for MADViewController will look like
//@interface -> @end contains all the class code. MADViewController is the class name, UIViewController is the superclass

//header definition for a method called buttonPressed
- (IBAction)buttonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *messageText;

@end
