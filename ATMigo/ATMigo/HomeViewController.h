//
//  HomeViewController.h
//  ATMigo
//
//  Created by Liam Ronan on 12/17/14.
//  Copyright (c) 2014 Liam Ronan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *venmoSignInButton;
- (IBAction)pressedVenmoSignInButton:(UIButton *)sender;

@end

