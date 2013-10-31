//
//  MADCountryViewController.h
//  countries
//
//  Created by Melissa on 10/29/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADDetailViewController.h"

@interface MADCountryViewController : UIViewController

@property (copy, nonatomic) NSString *addedCountry;
@property (weak, nonatomic) IBOutlet UITextField *countryText;

@end
