//
//  MADViewController.m
//  beatlesRedo
//
//  Created by Melissa on 9/17/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad{
    //value -1 will ensure that neither segment is selected initially
    _imageControl.selectedSegmentIndex = -1;
    [super viewDidLoad];
}

- (void)updateImage{
    if (_imageControl.selectedSegmentIndex==0){
        _titleLabel.text=@"young beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
    }
    else if (_imageControl.selectedSegmentIndex==1){
        _titleLabel.text=@"not as young beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
    }
}

- (void)changeFont{
    if (_capitalizeSwitch.on){
        _titleLabel.text=[_titleLabel.text uppercaseString];
    }
    else {
        _titleLabel.text=[_titleLabel.text lowercaseString];
    }
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self changeFont];
}
- (IBAction)updateFont:(UISwitch *)sender {
    [self changeFont];
}
- (IBAction)changeFontSize:(UISlider *)sender {
    //get the font size
    int fontSize = sender.value;
    // change the font size label
    _fontSizeLabel.text=[NSString stringWithFormat:@"%d", fontSize];
    // create a new font object
    UIFont *newFont = [UIFont systemFontOfSize:sender.value];
    //apply the new font to the label
    _titleLabel.font=newFont;
}
@end
