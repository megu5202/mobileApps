//
//  MADContinentInfoViewController.h
//  countries
//
//  Created by Melissa on 10/29/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADContinentInfoViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *continentName;
@property (weak, nonatomic) IBOutlet UILabel *countryNumber;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *number;

@end
