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


//declaring number of moves equals to 0
- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfMoves = 0;
}

//if the buttontapped's #of move is less than 9, computer puts value.
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
    //calling enterplayermove and then blue color x mark will be shown when you press the button
- (void)enterPlayerMove:(UIButton *) sender {
    [sender setTitle:@"X" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //it shows "computer's turn" on the screen and number of moves will increase by 1
    self.whichPlayerLabel.text = @"Computer's turn";
    self.numberOfMoves++;
}

    //
- (void)enterComputerValue {
    BOOL enteredValue = false;
    
    //when value is entered, random value
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
