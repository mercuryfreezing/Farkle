//
//  DieLabel.h
//  Farkle
//
//  Created by roshan on 08/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieDelegate

//-(void) didRollDiceWithInt:(NSMutableArray *) values;
-(void) didRollDiceWithInt:(int) value;

@end

@interface DieLabel : UILabel

@property id<DieDelegate> delegate;

-(IBAction) onTapped:(UITapGestureRecognizer *) sender;
-(void) roll;




@end
