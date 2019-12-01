//
//  AMTorso.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 16/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMTorso.h"
#import "AMSkeletonConstants.h"
#import "AMSkeletonUtils.h"

#define NECK_LENGTH 15

@interface AMTorso()

@property (strong, nonatomic) UIBezierPath *shape;
@property (strong, nonatomic) AMBodyPart *head;
@property (strong, nonatomic) AMBodyPart *leftArm;
@property (strong, nonatomic) AMBodyPart *rightArm;
@property (strong, nonatomic) AMBodyPart *leftLeg;
@property (strong, nonatomic) AMBodyPart *rightLeg;

@end

@implementation AMTorso

- (id)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
        [self frameChange];
    }
    return self;
}

- (void)customInit {
    self.backgroundColor = [UIColor clearColor];
    self.drawTorso = YES;
    self.drawJoints = YES;
    self.clipsToBounds = NO;
}

#pragma mark - Property override

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self frameChange];
}

#pragma mark - Drawing

- (void)frameChange {
    [self calculateJoints];
    [self calculateShapePath];
}

- (void)calculateJoints {
    CGFloat left = JOINT_RADIUS;
    CGFloat right = self.frame.size.width - JOINT_RADIUS;
    CGFloat middle = self.frame.size.width / 2;
    CGFloat highTop = JOINT_RADIUS;
    CGFloat lowTop = JOINT_RADIUS + NECK_LENGTH;
    CGFloat bottom = self.frame.size.height - JOINT_RADIUS;
    
    self.neckJoint = CGPointMake(middle, highTop);
    self.leftShoulderJoint = CGPointMake(left, lowTop);
    self.rightShoulderJoint = CGPointMake(right, lowTop);
    self.leftHipJoint = CGPointMake(left, bottom);
    self.rightHipJoint = CGPointMake(right, bottom);
}

- (void)calculateShapePath {
    CGPoint neckNape = CGPointMake(self.neckJoint.x, self.leftShoulderJoint.y);
    
    self.shape = [UIBezierPath bezierPath];
    [self.shape moveToPoint:self.leftShoulderJoint];
    [self.shape addLineToPoint:neckNape];
    [self.shape addLineToPoint:self.neckJoint];
    [self.shape addLineToPoint:neckNape];
    [self.shape addLineToPoint:self.rightShoulderJoint];
    [self.shape addLineToPoint:self.rightHipJoint];
    [self.shape addLineToPoint:self.leftHipJoint];
    [self.shape closePath];
}

- (void)drawRect:(CGRect)rect {
    if (self.drawTorso) {
        [SHAPE_STROKE setStroke];
        [SHAPE_FILL setFill];
        
        CGContextRef aRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(aRef);
        self.shape.lineWidth = SHAPE_STROKE_SIZE;
        [self.shape fill];
        [self.shape stroke];
        CGContextRestoreGState(aRef);
    }
    
    if (self.drawJoints) {
        [AMSkeletonUtils drawJointInPoint:self.neckJoint];
        [AMSkeletonUtils drawJointInPoint:self.leftHipJoint];
        [AMSkeletonUtils drawJointInPoint:self.leftShoulderJoint];
        [AMSkeletonUtils drawJointInPoint:self.rightShoulderJoint];
        [AMSkeletonUtils drawJointInPoint:self.rightHipJoint];
    }
}


#pragma mark - Attachment

- (void)attachToNeck:(AMBodyPart *)bodyPart {
    if (self.head) {
        [self.head removeFromSuperview];
    }
    self.head = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.head toJoint:self.neckJoint];
    [self addSubview:self.head];
}

- (void)attachToLeftShoulder:(AMBodyPart *)bodyPart {
    if (self.leftArm) {
        [self.leftArm removeFromSuperview];
    }
    self.leftArm = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.leftArm toJoint:self.leftShoulderJoint];
    [self addSubview:self.leftArm];
}

- (void)attachToRightShoulder:(AMBodyPart *)bodyPart {
    if (self.rightArm) {
        [self.rightArm removeFromSuperview];
    }
    self.rightArm = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.rightArm toJoint:self.rightShoulderJoint];
    [self addSubview:self.rightArm];
}

- (void)attachToLeftHip:(AMBodyPart *)bodyPart {
    if (self.leftLeg) {
        [self.leftLeg removeFromSuperview];
    }
    self.leftLeg = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.leftLeg toJoint:self.leftHipJoint];
    [self addSubview:self.leftLeg];
}

- (void)attachToRightHip:(AMBodyPart *)bodyPart {
    if (self.rightLeg) {
        [self.rightLeg removeFromSuperview];
    }
    self.rightLeg = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.rightLeg toJoint:self.rightHipJoint];
    [self addSubview:self.rightLeg];
}

#pragma mark - Animation

- (void)lowerTorso:(CGFloat)pixels interval:(CGFloat)interval {
    self.yOffset = pixels;
    [UIView animateWithDuration:interval delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
        CGAffineTransform transf = CGAffineTransformMakeTranslation(0, pixels);
        self.transform = transf;
    } completion:^(BOOL finished){
        
    }];
}

- (BOOL)supportsAnimationType:(AMAnimationType)type {
    return type == AMAnimationTypeOffsetY;
}

- (void)executeAnimationType:(AMAnimationType)type amount:(CGFloat)amount interval:(CGFloat)interval {
    if (type == AMAnimationTypeOffsetY) {
        [self lowerTorso:amount interval:interval];
    }
}

- (CGFloat)storedAmountForAnimationType:(AMAnimationType)type {
    return self.yOffset;
}

@end
