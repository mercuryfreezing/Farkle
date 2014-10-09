//
//  DieLabel.h
//  Farkle
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate

//-(void) didRollDiceWithInt:(NSMutableArray *) values;
-(void) didRollDiceWithInt:(int) value;
-(void) wasTapped:(UILabel *) label;

@end

@interface DieLabel : UILabel

@property id<DieLabelDelegate> delegate;
@property BOOL selected;

-(IBAction) onTapped:(UITapGestureRecognizer *) sender;
-(void) roll;




@end
