//
//  MADViewController.m
//  demo1
//
//  Created by Melissa on 9/9/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"


@implementation MADViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize: _statusLabel.font.pointSize]};
    NSRange nameRange = [plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
}

@end
