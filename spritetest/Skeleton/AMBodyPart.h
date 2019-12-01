//
//  AMBodyPart.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 16/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMAnimationUtils.h"

typedef enum : NSUInteger {
    AMPartTypeLimb,
    AMPartTypeHead,
    AMPartTypeHand,
    AMPartTypeLeftFoot,
    AMPartTypeRightFoot
} AMPartType;

@interface AMBodyPart : UIView

@property (assign, nonatomic) BOOL drawShape;
@property (assign, nonatomic) BOOL drawJoints;

@property (assign, nonatomic) CGPoint originJoint;
@property (assign, nonatomic) CGPoint endJoint;

@property (strong, nonatomic) UIBezierPath *shape;

@property (assign, nonatomic) AMPartType partType;

@property (assign, nonatomic) CGFloat degrees;

- (id)initWithFrame:(CGRect)frame andType:(AMPartType)type;

- (void)attachBodyPart:(AMBodyPart *)bodyPart;

- (BOOL)supportsAnimationType:(AMAnimationType)type;
- (void)executeAnimationType:(AMAnimationType)type amount:(CGFloat)amount interval:(CGFloat)interval;
- (CGFloat)storedAmountForAnimationType:(AMAnimationType)type;

- (void)calculateJoints;

+ (AMBodyPart *)bodyPartWithFrame:(CGRect)frame andType:(AMPartType)type;

@end
