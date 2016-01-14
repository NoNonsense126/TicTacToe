//
//  ViewController.m
//  TicTacToe
//
//  Created by Wong You Jing on 14/01/2016.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton *buttonTest = (UIButton *)[self.view viewWithTag:100];

}
- (IBAction)onPlayButtonTapped:(UIButton *)sender {
    [sender setTitle:@"X" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.whichPlayerLabel.text = @"Computer's turn";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
