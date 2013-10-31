//
//  CountryViewController.h
//  countries
//
//  Created by Melissa on 10/29/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADDetailViewController.h"

@interface CountryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *countryText;
@property (copy, nonatomic) NSString *addedCountry;

@end
