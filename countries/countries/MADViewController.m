//
//  MADViewController.m
//  countries
//
//  Created by Melissa on 10/24/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"
#import "MADDetailViewController.h"
#import "MADContinentInfoViewController.h"

@interface MADViewController (){
    NSMutableDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //returns a bundle object of our app
	NSBundle *bundle=[NSBundle mainBundle];
    //retrieve the path of continents.plist
    NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"];
    //loads the contents of the plist file into a dictionary
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath]; 
    //the dictionary uses the continents as the keys and a NSArray with the countries for each continent. 
    continentData = dictionary;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count]; //returns the number of continents
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    //creates an array with all keys from our dictionary
    NSArray *rowData=[continentData allKeys];
    //sets the text of the cell with the row being requested
    cell.textLabel.text=[rowData objectAtIndex:indexPath.row];
    
    return cell; 
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"countrySegue"]) {
        MADDetailViewController *countryViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //creates an array with all keys from our dictionary
        NSArray *rowData = [continentData allKeys];
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title]; 
    }
    if ([segue.identifier isEqualToString: @"continentSegue"]) {
        MADContinentInfoViewController *infoViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *rowData = [continentData allKeys];
        infoViewController.name = [rowData objectAtIndex:indexPath.row];
        infoViewController.number = [NSString stringWithFormat:@"%d",
                                   [[continentData objectForKey:infoViewController.name]
                                    count]];
    }
}


@end
