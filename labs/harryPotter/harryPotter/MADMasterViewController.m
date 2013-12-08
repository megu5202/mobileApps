//
//  MADMasterViewController.m
//  harryPotter
//
//  Created by Melissa on 10/31/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADMasterViewController.h"

#import "MADDetailViewController.h"

/* @interface MADMasterViewController () {
    NSMutableArray *_objects;
}
@end */

@implementation MADMasterViewController

- (void)awakeFromNib{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    /* self.navigationItem.leftBarButtonItem = self.editbuttonItem;
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
        action:@selector(insertNewObject:)];
     self.navigationItem.reightBarButtonItem = addButton;
     self.detailViewController = (MADDetailViewController *)
        [[self.splitViewController.viewControllers lastObject] topViewController]; */
    
    //returns a bundle object of our app
    NSBundle *bundle = [NSBundle mainBundle];
    //retrieve the path of harrypotter.plist
    NSString *plistPath = [bundle pathForResource:@"harrypotter"
                                         ofType:@"plist"];
    //loads the contents of the plist file into a dictionary
    NSDictionary *characterInfo = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    //assigns all the character keys to our array
    self.characters=[characterInfo objectForKey:@"characters"];
    self.detailViewController = (MADDetailViewController *)[
                                                            [self.splitViewController.viewControllers lastObject]
                                                            topViewController];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)insertNewObject:(id)sender{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
} */

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // Configure the cell
    NSDictionary *characterChoosen = [_characters objectAtIndex:indexPath.row]; //assigns dictionary item of the row
    //assigns the value of name to the cell
    cell.textLabel.text = [characterChoosen objectForKey:@"name"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
} */

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //assigns dictionary item of the row
    NSDictionary *characterChoosen = [self.characters objectAtIndex:indexPath.row];
    //assigns the url of the row
    NSString *url= [characterChoosen objectForKey:@"url"];
    self.detailViewController.detailItem = url;
    NSString *name=[characterChoosen objectForKey:@"name"];
    self.detailViewController.title = name;
}

@end
