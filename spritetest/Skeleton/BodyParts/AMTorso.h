//
//  AMTorso.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 16/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMBodyPart.h"

@interface AMTorso : AMBodyPart

@property (assign, nonatomic) BOOL drawTorso;
@property (assign, nonatomic) BOOL drawJoints;

@property (assign, nonatomic) CGPoint neckJoint;
@property (assign, nonatomic) CGPoint leftShoulderJoint;
@property (assign, nonatomic) CGPoint rightShoulderJoint;
@property (assign, nonatomic) CGPoint leftHipJoint;
@property (assign, nonatomic) CGPoint rightHipJoint;

@property (assign, nonatomic) CGFloat yOffset;

- (void)attachToNeck:(AMBodyPart *)bodyPart;
- (void)attachToLeftShoulder:(AMBodyPart *)bodyPart;
- (void)attachToRightShoulder:(AMBodyPart *)bodyPart;
- (void)attachToLeftHip:(AMBodyPart *)bodyPart;
- (void)attachToRightHip:(AMBodyPart *)bodyPart;

- (void)lowerTorso:(CGFloat)pixels interval:(CGFloat)interval;

@end
