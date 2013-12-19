//
//  MADThirdViewController.m
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

//#import "MADTabViewController.h"
#import "MADThirdViewController.h"
#import "MADDrinkListViewController.h"

@interface MADThirdViewController (){
    NSMutableDictionary *drinkTypeData; //plist information
}
@end

@implementation MADThirdViewController

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

/*- (void)sendDataToTabViewController{
    //double drinks = _drinkStepper.value;
    //double hours = _hourStepper.value;
    //[(MADTabViewController*)self.tabBarController updateDrinksAndHours:drinks :hours];
    [(MADTabViewController*)self.tabBarController updateBAC];
    double bac = [(MADTabViewController*)self.tabBarController getBAC];
    [(MADTabViewController*)self.tabBarController updateDrunkenness: bac];
}*/

- (void)viewDidLoad{
    [super viewDidLoad];
    /* load plist data into drinkTypeData dictionary */
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource: @"drinks" ofType: @"plist"];
    drinkTypeData = [[NSMutableDictionary alloc] initWithContentsOfFile: plistPath];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"MADThirdViewController - viewWillAppear");
    
    //double drinks = [(MADTabViewController*)self.tabBarController getDrinks];
    //double hours = [(MADTabViewController*)self.tabBarController getHours];
    
    //if (drinks == 0) _drinksOut.text = @"0";
    //else _drinksOut.text = [NSString stringWithFormat:@"%.0f", drinks];
    
    //if (hours == 0) _hoursOut.text = @"0";
    //else _hoursOut.text = [NSString stringWithFormat:@"%.0f", hours];
}

/* two functions required by UITableViewDataSource */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"MADThirdViewController - tableView numberOfRowsInSection");
    return [drinkTypeData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"MADThirdViewController - tableView cellForRowAtIndexPath");
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                        reuseIdentifier: cellIdentifier];
    }
    NSArray *rowData = [drinkTypeData allKeys];
    cell.textLabel.text = [rowData objectAtIndex:indexPath.row];
    
    return cell;
}

/* this function tells the view controller to deselect the previously selected data */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"MADThirdViewController - tableView didSelectRowAtIndexPath");
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

/*- (IBAction)drinksChanged:(UIStepper *)sender {
    //_drinksOut.text = [NSString stringWithFormat:@"%.0f", _drinkStepper.value];
    [self sendDataToTabViewController];
}

- (IBAction)hoursChanged:(UIStepper *)sender {
    //_hoursOut.text = [NSString stringWithFormat:@"%.0f", _hourStepper.value];
    [self sendDataToTabViewController];
}*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"MADThirdViewController - prepareForSegue");
    if ([segue.identifier isEqualToString:@"drinkTypeSegue"]){
        MADDrinkListViewController *drinkListViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *rowData = [drinkTypeData allKeys];
        drinkListViewController.title = [rowData objectAtIndex:indexPath.row];
        drinkListViewController.currentDrinkType = [rowData objectAtIndex:indexPath.row];
        drinkListViewController.drinkList = [drinkTypeData objectForKey:drinkListViewController.title];
        /* set back button to be shorter so that it fits nicely */
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle: @"Drink Type"
                                                                       style: UIBarButtonItemStyleBordered
                                                                      target: nil
                                                                      action: nil];
        self.navigationItem.backBarButtonItem = backButton;
    }
}

/*- (void)viewWillDisappear:(BOOL)animated{
    [self sendDataToTabViewController];
}*/

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
