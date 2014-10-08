//
//  ViewController.m
//  Farkle
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DieDelegate>
@property (readwrite) IBOutlet DieLabel *labelForDice1;
@property (readwrite) IBOutlet DieLabel *labelForDice2;
@property (readwrite) IBOutlet DieLabel *labelForDice3;
@property (readwrite) IBOutlet DieLabel *labelForDice4;
@property (readwrite) IBOutlet DieLabel *labelForDice5;
@property (readwrite) IBOutlet DieLabel *labelForDice6;
@property NSMutableArray *allLabels;

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
        eachLabel.delegate = self;
    }

}

- (IBAction)onButtonPressed:(UIButton *)sender {

    for(DieLabel *eachLabel in self.allLabels)
    {
        [eachLabel roll];
    }
}


-(void) didRollDiceWithInt:(int)value{

    NSLog(@"%d", value);
}

@end
