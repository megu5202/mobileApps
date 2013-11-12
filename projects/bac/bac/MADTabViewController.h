//
//  MADTabViewController.h
//  bac
//
//  Created by Melissa on 11/7/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADTabViewController : UITabBarController{
    NSInteger gender; // -1: not selected, 0: male, 1: female
    double weight;
    double age;
    double drinks;
    double hours;
    BOOL goodData; //TRUE if all the stats data is good for calculations, FALSE is it is not
    float bac;
    NSString *drunkenness;
}
//function declarations & any @property things

- (NSInteger)getGender;
- (double)getWeight;
- (double)getAge;
- (double)getDrinks;
- (double)getHours;
- (float)getBAC;
- (NSString*)getDrunkenness;

- (BOOL)checkForData;
- (BOOL)checkWeight;
- (BOOL)checkAge;
- (BOOL)checkData;

- (void)updateStats: (NSInteger)newGender : (double)newWeight : (double)newAge;
- (void)updateDrinksAndHours: (double)newDrinks : (double)newHours;
- (void)updateBAC;
- (void)updateDrunkenness: (double)currentBac;

@end
