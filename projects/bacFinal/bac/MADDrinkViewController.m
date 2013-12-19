//
//  MADDrinkViewController.m
//  bac
//
//  Created by Melissa on 12/14/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADDrinkViewController.h"
#import "MADTabViewController.h"

@interface MADDrinkViewController (){
    NSMutableDictionary *drinkImages;
}

@end

@implementation MADDrinkViewController{
    UIImage *drinkImage;
}

- (void) sendAlert:(NSString *) alertTitle : (NSString *) alertMessage{
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle: alertTitle
                              message: alertMessage
                              delegate:self
                              cancelButtonTitle: @"Ok"
                              otherButtonTitles: nil];
    [alertView show];
}

- (void)sendDataToTabViewController: (double) drinksToAdd : (NSDate *) currentTime{
    [(MADTabViewController*)self.tabBarController updateDrinksAndHours:drinksToAdd :currentTime];
    [(MADTabViewController*)self.tabBarController updateBAC];
    double bac = [(MADTabViewController*)self.tabBarController getBAC];
    [(MADTabViewController*)self.tabBarController updateDrunkenness: bac];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    //_drinkName.text = _name;
    //_drinkABV.text = _ABV;
    //_drinkDetails.text = _details;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource: @"drinkImages" ofType: @"plist"];
    drinkImages = [[NSMutableDictionary alloc] initWithContentsOfFile: plistPath];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drinkButton:(id)sender {
    //get the current time
    NSDate *now = [NSDate date];
    //send time, and 1 drink increase to updateData
    [self sendDataToTabViewController: 1 : now];
    //go back to add a drink screen or send an alert saying a drink was added
    [self sendAlert:@"Congrats!" :@"Drink was recorded"];
}

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else{
        NSLog(@"Cant access camera");
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo: (void *)contextInfo{
    if (error != nil) NSLog(@"Image Can not be saved");
    else NSLog(@"Successfully saved Image");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        drinkImage = editedImage ? editedImage : originalImage;
        _imageView.image = drinkImage;
        
        //save image to camera roll
        UIImageWriteToSavedPhotosAlbum(drinkImage, self, @selector(image:didFinishSavingWithError: contextInfo:), nil);
    } 
    [self dismissViewControllerAnimated:YES completion:NULL]; 
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
