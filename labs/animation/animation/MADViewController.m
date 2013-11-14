//
//  MADViewController.m
//  animation
//
//  Created by Melissa on 11/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController {
    CGPoint delta;
    NSTimer *timer;
    float imageCenter;
    CGPoint translation;
    float angle;
}

-(IBAction)changeSliderValue{
    _sliderLabel.text=[NSString stringWithFormat:@"%.2f", _slider.value];
    
    //create a new timer object with the slider's time interval
    timer = [NSTimer scheduledTimerWithTimeInterval:_slider.value   // # sec between timer firing
                                             target: self
                                           selector:@selector(onTimer) //message sent when timer fires
                                           userInfo:nil
                                            repeats:YES]; // whether of not timer repeatedly reschedules
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //imageCenter is half the width of the image
    imageCenter = _imageView.frame.size.width/2;
    
    //initialize the delta, telling the image to move 12 pixels horizontally and 4 pixels vertically
    delta = CGPointMake(12.0, 4.0);
    
    translation = CGPointMake(0.0, 0.0);
    angle = 0.0;
    
    [self changeSliderValue];
}

//change the position of the image view
-(void) onTimer{
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_slider.value
                          delay: 0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations: ^{
                         _imageView.center = CGPointMake(_imageView.center.x + delta.x, _imageView.center.y + delta.y);
                         _imageView.transform = CGAffineTransformMakeRotation(angle);
                         //_imageView.transform = CGAffineTransformMakeScale(angle, angle);
                         angle += 0.05;
                         if (angle > (2 * M_PI)) angle = 0;
                     }
                     completion: NULL];
    [UIView commitAnimations];
    
    //if image touched the sides of screen it reverses direction
    if (_imageView.center.x > self.view.bounds.size.width - imageCenter || _imageView.center.x < imageCenter)
        delta.x = -delta.x;
    
    //if the image touched the top of bottom of the screen it reverses the direction
    if (_imageView.center.y > self.view.bounds.size.height - imageCenter || _imageView.center.y < imageCenter)
        delta.y = -delta.y;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    //cant change the interval once the timer is created, so we stop (invalidate it) then create a new object
    [timer invalidate];
    [self changeSliderValue];
}
@end
