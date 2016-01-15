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
@property int numberOfMoves;
@property NSString *winner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfMoves = 0;
}

- (IBAction)onPlayButtonTapped:(UIButton *)sender {
    [self enterPlayerMove:sender];
    if(self.numberOfMoves < 9){
        [self enterComputerValue];
    }
//    [self checkGameWon];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)enterPlayerMove:(UIButton *) sender {
    [sender setTitle:@"X" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    self.whichPlayerLabel.text = @"Computer's turn";
    self.numberOfMoves++;
}


- (void)enterComputerValue {
    BOOL enteredValue = false;
    
    while (!enteredValue) {
        int randomNumber = (arc4random() % 9) + 100;
        UIButton *button = (UIButton *)[self.view viewWithTag:randomNumber];
        
        NSString *buttonTitle = button.currentTitle;
        if (buttonTitle == nil) {
            [button setTitle:@"O" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            enteredValue = true;
        }
    }
    self.numberOfMoves++;
    self.whichPlayerLabel.text = @"Player's turn";
}

//- (NSString *)whoWon {
//    if([self.buttonOne.titleLabel.text isEqualToString:self.buttonTwo.titleLabel.text] && [self.buttonTwo.titleLabel.text isEqualToString:self.buttonThree.titleLabel.text] ){
//        
//    }
//}
@end
