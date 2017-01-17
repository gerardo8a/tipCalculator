//
//  ViewController.m
//  tipCalculator
//
//  Created by Jorge Gerardo Porras on 1/15/17.
//  Copyright © 2017 yahoo. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    // Investigating how to import as function from settings View to avoid code duplication

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults integerForKey:@"tipIndexValue"] != nil) {
        self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"tipIndexValue"];
    } else {
        self.tipControl.selectedSegmentIndex = 0;
    }
    [self updateValues];
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing: YES];
    [self updateValues];
}

- (void)updateValues {
    //Get data
    float billAmount = [self.billTextField.text floatValue];
    
    //Calculate tip
    NSArray *tipValues  = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    //update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",   totalAmount];

}

@end
