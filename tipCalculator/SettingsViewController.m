//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Jorge Gerardo Porras on 1/16/17.
//  Copyright © 2017 yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Not sure how to get rid of the warning because pointiner comared with nil, tried casting but it did not worked
    if ([defaults integerForKey:@"tipIndexValue"] != nil) {
        self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"tipIndexValue"];
    } else {
        self.tipControl.selectedSegmentIndex = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"tipIndexValue"];
    [defaults synchronize];
}

@end
