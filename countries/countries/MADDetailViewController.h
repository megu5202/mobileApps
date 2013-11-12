//
//  MADDetailViewController.h
//  countries
//
//  Created by Melissa on 10/24/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDetailViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate>

@property(strong,nonatomic)NSMutableArray *countryList; 

@end
