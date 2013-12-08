//
//  MADViewController.m
//  musicDependent
//
//  Created by Melissa on 10/3/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"artistalbums" ofType:@"plist"];
    
    _artistAlbums = [[NSDictionary alloc] initWithContentsOfFile: plistPath];
    _artists = [_artistAlbums allKeys];
    NSString *selectedArtist = [_artists objectAtIndex:0];
    _albums = [_artistAlbums objectForKey: selectedArtist];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == artistComponent) return [_artists count];
    else return [_albums count];
}

// Picker delegate methods
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == artistComponent) return [_artists objectAtIndex:row];
    else return [_albums objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == artistComponent){
        NSString *selectedArtist = [_artists objectAtIndex:row];
        _albums = [_artistAlbums objectForKey:selectedArtist];
        [_musicPicker selectRow:0 inComponent:albumComponent animated:YES];
        [_musicPicker reloadComponent:albumComponent];
    }
    NSInteger artistrow = [_musicPicker selectedRowInComponent:artistComponent];
    NSInteger albumrow = [_musicPicker selectedRowInComponent:albumComponent];
    _choiceLabel.text = [NSString stringWithFormat:@"You like %@ by %@", [_albums objectAtIndex:albumrow], [_artists objectAtIndex:artistrow]];
}

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == albumComponent) return 175;
    else return 120;
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 33;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
