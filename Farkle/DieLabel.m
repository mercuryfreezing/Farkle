//
//  DieLabel.m
//  Farkle
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel


-(IBAction)onTapped:(UITapGestureRecognizer *)sender{

    if(self.isEnabled)
    {

        self.selected = YES;
        [self.delegate wasTapped:self];

    }


}



-(void) roll{

    if(!self.selected)
    {
        int randomNumber;
    //    NSMutableArray *values = [[NSMutableArray alloc] init];
    //    for(int i=0; i<6; i++)
    //    {
            randomNumber =arc4random_uniform(6)+1;
    //        [values insertObject:@(randomNumber).description atIndex:0];

    //    }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.delegate didRollDiceWithInt:randomNumber];

            self.text = [NSString stringWithFormat:@"%d", randomNumber];
        });
    }


}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
