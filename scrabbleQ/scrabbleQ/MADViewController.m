//
//  MADViewController.m
//  scrabbleQ
//
//  Created by Melissa on 10/24/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController (){
    NSDictionary *words;
    NSArray *letters;

}

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //return a bundle object of our app
    NSBundle *bundle = [NSBundle mainBundle];
    //retrieve the path of continents.plist
    NSString *plistPath = [bundle pathForResource:@"qwordswithoutu2" ofType:@"plist"];
    //loads the contents of the plist file into a dictionary
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    //the dictionary uses letters as the keys and a NSArray with the words for each letter.
    words = dictionary;
    //grabs all the keys and sorted them to create an ordered array with all the values in alphabetical order
    NSArray *array = [[words allKeys] sortedArrayUsingSelector:@selector(compare:)];
    letters = array;
    //sets the title of the controller
    self.title = @"Words";
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

//Required methods for UITableViewDataSource
//Customize the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //gets the letter for the choosen section
    NSString *letter=[letters objectAtIndex:section];
    //gets the words for that letter
    NSArray *letterSection=[words objectForKey:letter];
    //returns number of words in that section
    return [letterSection count];
}

// Displays table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //gets the section
    NSUInteger section=[indexPath section];
    //gets the row
    NSUInteger row=[indexPath row];
    //gets the letter of the requested section
    NSString *letter=[letters objectAtIndex:section];
    //gets the words for that section
    NSArray *wordsSection=[words objectForKey:letter];
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    //sets the text of the cell with the row being requested
    cell.textLabel.text=[wordsSection objectAtIndex:row];
    
    return cell;
}

//UITableViewDelegate method that is called when a row is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //gets the section
    NSUInteger section=[indexPath section];
    //gets the letter of the requested section
    NSString *letter=[letters objectAtIndex:section];
    //gets the words for that section
    NSArray *wordsSection=[words objectForKey:letter];
    //sets the title of the selected row
    NSString *rowValue=[wordsSection objectAtIndex:indexPath.row];
    NSString *message=[[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc]
                        initWithTitle:@"Row Selected"
                        message:message
                        delegate:nil
                        cancelButtonTitle:@"Yes, I did"
                        otherButtonTitles:nil];
    [alert show];
    //deselects the row that had been choosen
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//UITableViewDatasource method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [letters count]; //each letter will be a section
}

//Sets the header value for each section
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //gets the letter of the requested section
    NSString *letter=[letters objectAtIndex:section];
    //returns the letter as the header value
    return letter;
}

//adds a section index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return letters; 
}


@end
