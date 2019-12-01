//
//  AMLimb.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 19/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMLimb.h"
#import "AMSkeletonConstants.h"

@implementation AMLimb

- (void)calculateJoints {
    CGFloat middle = self.frame.size.width / 2;
    CGFloat top = JOINT_RADIUS;
    CGFloat bottom = self.frame.size.height - JOINT_RADIUS;
    
    self.originJoint = CGPointMake(middle, top);
    self.endJoint = CGPointMake(middle, bottom);
}

- (void)drawRect:(CGRect)rect {
    if (self.drawShape) {
        [SHAPE_STROKE setStroke];
        [SHAPE_FILL setFill];
        
        CGContextRef aRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(aRef);
        self.shape.lineWidth = SHAPE_STROKE_SIZE;
        [self.shape fill];
        [self.shape stroke];
        CGContextRestoreGState(aRef);
    }
    [super drawRect:rect];
}

- (BOOL)supportsAnimationType:(AMAnimationType)type {
    return type == AMAnimationTypeRotate;
}

- (void)executeAnimationType:(AMAnimationType)type amount:(CGFloat)amount interval:(CGFloat)interval {
    if (type == AMAnimationTypeRotate) {
        [self rotateDegrees:amount interval:interval];
    }
}

- (CGFloat)storedAmountForAnimationType:(AMAnimationType)type {
    return self.degrees;
}

@end
