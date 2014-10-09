//
//  ViewController.m
//  Farkle
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DieLabelDelegate>
@property (readwrite) IBOutlet DieLabel *labelForDice1;
@property (readwrite) IBOutlet DieLabel *labelForDice2;
@property (readwrite) IBOutlet DieLabel *labelForDice3;
@property (readwrite) IBOutlet DieLabel *labelForDice4;
@property (readwrite) IBOutlet DieLabel *labelForDice5;
@property (readwrite) IBOutlet DieLabel *labelForDice6;
@property NSMutableArray *allLabels;
@property NSMutableArray *dice; //Keep track of dice selected
@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.allLabels = [NSMutableArray arrayWithObjects:self.labelForDice1,
                                                            self.labelForDice2,
                                                            self.labelForDice3,
                                                            self.labelForDice4,
                                                            self.labelForDice5,
                                                            self.labelForDice6,
                              nil];

    for(DieLabel *eachLabel in self.allLabels)
    {
        eachLabel.text = @(0).description;
    }

    for(DieLabel *eachLabel in self.allLabels)
    {
        eachLabel.delegate = self;
    }


    self.dice = [[NSMutableArray alloc] init];

}

- (IBAction)onButtonPressed:(UIButton *)sender {

    //roll happens only for those labels not in the dice array

    for(DieLabel *eachLabel in self.allLabels)
    {
        [eachLabel roll];
    }

    int total = 0;
    self.userScoreLabel.text = @(total).description;
    [self calculateUserScore];

}

-(void) didRollDiceWithInt:(int)value{

    NSLog(@"Value of dice rolled is %d", value);

}

-(void) wasTapped:(UILabel *)label{

    label.backgroundColor = [UIColor greenColor];
    [self.dice insertObject:label atIndex:0];
    NSLog(@"Number of dice selected is %lu", (unsigned long)self.dice.count);

}

-(void) calculateUserScore{

    int one_count;
    int two_count;
    int three_count;
    int four_count;
    int five_count;
    int six_count;

    int total =0;

    for(DieLabel *eachLabel in self.dice)
    {
        if(eachLabel.text.intValue == 1)
            one_count++;
        if(eachLabel.text.intValue == 2)
            two_count++;
        if(eachLabel.text.intValue == 3)
            three_count++;
        if(eachLabel.text.intValue == 4)
            four_count++;
        if(eachLabel.text.intValue == 5)
            five_count++;
        if(eachLabel.text.intValue == 6)
            six_count++;
    }

    if(one_count==3)
        total = 1000;
    if(two_count==3)
        total += 200;
    if(three_count==3)
        total += 300;
    if(four_count==3)
        total += 400;
    if(five_count==3)
        total += 500;
    if(six_count==3)
        total += 600;

    self.userScoreLabel.text = @(total).description;

}



@end
