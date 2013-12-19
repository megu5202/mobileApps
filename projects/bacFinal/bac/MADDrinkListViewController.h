//
//  MADDrinkDetailViewController.h
//  bac
//
//  Created by Melissa on 12/12/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDrinkListViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic)NSMutableArray *drinkList;
@property(weak, nonatomic) NSString *currentDrinkType;

@end
