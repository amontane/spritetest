//
//  AMPerson.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 19/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMTorso.h"
#import "AMBodyPart.h"
#import "AMAnimationConstants.h"

#define AMPersonMoveTorsoYOffset @"torsoYOffset"
#define AMPersonMoveLeftArmRotation @"leftArmRotation"
#define AMPersonMoveLeftVambraceRotation @"leftVambraceRotation"
#define AMPersonMoveRightArmRotation @"rightArmRotation"
#define AMPersonMoveRightVambraceRotation @"rightVambraceRotation"
#define AMPersonMoveLeftHighLegRotation @"leftHighLegRotation"
#define AMPersonMoveLeftLowLegRotation @"leftLowLegRotation"
#define AMPersonMoveRightHighLegRotation @"rightHighLegRotation"
#define AMPersonMoveRightLowLegRotation @"rightLowLegRotation"

@interface AMPerson : UIView

- (void)setUp;
- (void)setUp:(NSDictionary *)initialState;

- (void)moveToState:(NSDictionary *)state inInterval:(CGFloat)interval;
- (void)resetToInitialPositionInInterval:(CGFloat)interval;
- (void)resetToInitialPositionOperations:(NSArray *)operations inInterval:(CGFloat)interval;

- (void)scheduleMoveToState:(NSDictionary *)state startOn:(CGFloat)start during:(CGFloat)interval;
- (void)scheduleResetToInitialPositionStartOn:(CGFloat)start during:(CGFloat)interval;
- (void)scheduleResetToInitialPositionOperations:(NSArray *)operations startOn:(CGFloat)start during:(CGFloat)interval;

- (void)startMoving;
- (void)stopMoving;

@end
