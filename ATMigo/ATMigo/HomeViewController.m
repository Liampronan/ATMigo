//
//  HomeViewController.m
//  ATMigo
//
//  Created by Liam Ronan on 12/17/14.
//  Copyright (c) 2014 Liam Ronan. All rights reserved.
//

#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface HomeViewController ()
// Assumes input like "#00FF00" (#RRGGBB).


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.venmoSignInButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.venmoSignInButton.layer.borderWidth = 1.0;
    self.tabBarController.tabBar.tintColor = [HomeViewController colorFromHexString:@"#FFFFFF"];
    
//    self.parentViewController.navigationItem.title = self.title;
//    self.parentViewController.navigationItem.title = @"Sign In"; //set title of top navbar TODO: find better way to do this...
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedVenmoSignInButton:(UIButton *)sender {
    NSLog(@"yoooo");
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
