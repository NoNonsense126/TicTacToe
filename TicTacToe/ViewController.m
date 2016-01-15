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
@property int cellsPerRow;
@property int totalCells;
@property NSString *winner;
@end

@implementation ViewController


//declaring number of moves equals to 0
- (void)viewDidLoad {
    [super viewDidLoad];
    [self gameBeginSettings];
}

//if the buttontapped's #of move is less than 9, computer puts value.
- (IBAction)onPlayButtonTapped:(UIButton *)sender {
    if(sender.currentTitle != nil){
        return ;
    }

    [self enterPlayerMove:sender];
    [self enterComputerValue];
    
}
    //calling enterplayermove and then blue color x mark will be shown when you press the button
- (void)enterPlayerMove:(UIButton *) sender {
    [sender setTitle:@"X" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    if(![[self whoWon:sender] isEqualToString:@""]){
        [self displayWinningAlert:[self whoWon:sender]];
    };
    //it shows "computer's turn" on the screen and number of moves will increase by 1
    self.whichPlayerLabel.text = @"Computer's turn";
    self.numberOfMoves++;
}

    //
- (void)enterComputerValue {
   if(self.numberOfMoves < self.totalCells){
        BOOL enteredValue = false;
        UIButton *button;
       //when value is entered, random value
        while (!enteredValue) {
            int randomNumber = (arc4random() % self.totalCells) + 100;
            button = (UIButton *)[self.view viewWithTag:randomNumber];
        
            NSString *buttonTitle = button.currentTitle;
            if (buttonTitle == nil) {
                [button setTitle:@"O" forState:UIControlStateNormal];
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                enteredValue = true;
            }
        }
       
       self.numberOfMoves++;
       
       if(![[self whoWon:button] isEqualToString:@""]){
           [self displayWinningAlert:[self whoWon:button]];
       };
       
       self.whichPlayerLabel.text = @"Player's turn";
   }
}

- (NSString *) whoWon:(UIButton *)lastButton{
    // find location of button
    int boxNum = (int)[lastButton tag] - 100;
    
    //check same row + column + diagonal
    if ([self rowComplete:boxNum] || [self columnComplete:boxNum] || [self diagonalComplete:boxNum]) {
        return lastButton.currentTitle;
    }
    NSLog(@"number of moves %d", self.numberOfMoves);
    if(self.numberOfMoves == 9){

        return @"Draw";
    }
    
    return @"";
}

- (BOOL)rowComplete:(int)boxNum{
    // find which row
    int rowIndex = (boxNum)/self.cellsPerRow;
    // check first object with every object in row
    for (int i = 1; i < self.cellsPerRow; i++) {
        if(![[self getButtonTitleLabelByIndex:(rowIndex * self.cellsPerRow)] isEqualToString:[self getButtonTitleLabelByIndex:(rowIndex * self.cellsPerRow) + i]]){
            return NO;
        }
    }
    return YES;
}

- (BOOL)columnComplete:(int)boxNum{
    // find which column
    int columnIndex = boxNum % self.cellsPerRow;
    // check first object with every object in column
    for (int i = 1; i < self.cellsPerRow; i++) {
        if(![[self getButtonTitleLabelByIndex:columnIndex] isEqualToString:[self getButtonTitleLabelByIndex:columnIndex + (self.cellsPerRow * i)]]){
            return NO;
        }
    }
    return YES;
}

- (BOOL)diagonalComplete:(int)boxNum{
    return [self rightDownDiagonalComplete:boxNum] || [self leftDownDiagonalComplete:boxNum];
}

- (BOOL)rightDownDiagonalComplete:(int)boxNum{
    int multiplier = (self.cellsPerRow + 1);
    if(boxNum % multiplier == 0){
        for (int i = 0; i < self.cellsPerRow; i++) {
            if(![[self getButtonTitleLabelByIndex:0] isEqualToString:[self getButtonTitleLabelByIndex:multiplier * i]]){
                return NO;
            }
        }
        return YES;
    }
    return NO;
    
}

- (BOOL)leftDownDiagonalComplete:(int)boxNum{
    int multiplier = (self.cellsPerRow - 1);
    if(boxNum % multiplier == 0){
        for (int i = 1; i <= self.cellsPerRow; i++) {
            if(![[self getButtonTitleLabelByIndex:boxNum] isEqualToString:[self getButtonTitleLabelByIndex:i * multiplier]]){
                return NO;
            }
        }
        return YES;
    }
    return NO;
    
}



- (NSString *) getButtonTitleLabelByIndex:(int)index{
    int tagNumber = index + 100;
    UIButton *button = (UIButton *)[self.view viewWithTag:tagNumber];
    return button.currentTitle;
}

- (void)displayWinningAlert:(NSString *)message{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Game Won" message:[NSString stringWithFormat:@"%@ has won game", message] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *startNewGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self gameBeginSettings];
        for (int i = 0; i < self.totalCells; i++) {
            UIButton *button = (UIButton *)[self.view viewWithTag:(i + 100)];
            [button setTitle:nil forState:UIControlStateNormal];
        }
    }];
    
    [controller addAction:startNewGameAction];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)gameBeginSettings{
    self.cellsPerRow = 3;
    self.totalCells = (self.cellsPerRow * self.cellsPerRow);
    self.numberOfMoves = 0;
}
@end
