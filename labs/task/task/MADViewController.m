//
//  MADViewController.m
//  task
//
//  Created by Melissa on 12/3/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"
#define kFilename @"archive"
#define kDataKey @"data"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSString *filePath = [self dataFilePath];
    //check to see if the file exists
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        //create instance from archive file
        NSData * data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        //create an instance to decode the data
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData: data];
        //read the objects from the archiver
        MADArchive *taskArchive=[unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding]; //tell the unarchiver we're finished
        _task1.text=taskArchive.taskone;
        _task2.text=taskArchive.tasktwo;
        _task3.text=taskArchive.taskthree;
        _task4.text=taskArchive.taskfour;
    }
    UIApplication *app = [UIApplication sharedApplication];
    //subscribe to the UIApplicationWillResignActiveNotification notification
    [[NSNotificationCenter defaultCenter] addObserver: self //MADViewController should be notified
                                             selector: @selector(applicationWillResignActive:) //call this function when notification is received
                                                 name: UIApplicationWillResignActiveNotification //notification posted when app is no longer active
                                               object: app]; //object we're getting the notification from
}

//called when the UIApplicationWillResignActiveNotification notification is posted
//all notification methods take a single NSNotification instance as their argument
- (void) applicationWillResignActive:(NSNotification *)notification {
    MADArchive *taskArchive = [[MADArchive alloc] init];
    taskArchive.taskone = _task1.text;
    taskArchive.tasktwo = _task2.text;
    taskArchive.taskthree = _task3.text;
    taskArchive.taskfour = _task4.text;
    //create an instance to hold the encoded data
    NSMutableData *data = [[NSMutableData alloc] init];
    //create instance to archive objects
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //archive objects
    [archiver encodeObject: taskArchive forKey: kDataKey];
    [archiver finishEncoding];
    //write the contents of the array to our plist file
    [data writeToFile: [self dataFilePath] atomically: YES];
}

- (NSString *)dataFilePath{
    //locate document directory
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //create full path to our data file
    NSString *docDirectory = [path objectAtIndex:0];
    return [docDirectory stringByAppendingPathComponent:kFilename];

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
