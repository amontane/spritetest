//
//  AMHead.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 18/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMHead.h"
#import "AMSkeletonConstants.h"
#import "AMSkeletonUtils.h"

@implementation AMHead

- (void)calculateJoints {
    CGFloat bottom = self.frame.size.height - JOINT_RADIUS;
    CGFloat middleX = (self.frame.size.width / 2);
    
    self.originJoint = CGPointMake(middleX, bottom);
    self.endJoint = CGPointZero;
}

- (void)drawRect:(CGRect)rect {
    if (self.drawShape) {
        CGRect shapeFrame = CGRectMake(SHAPE_STROKE_SIZE, SHAPE_STROKE_SIZE, self.frame.size.width - (SHAPE_STROKE_SIZE * 2), self.frame.size.height - (SHAPE_STROKE_SIZE * 2));
        CGContextRef aRef = UIGraphicsGetCurrentContext();
        CGContextSaveGState(aRef);
        CGPathRef path = CGPathCreateMutable();
        CGPathAddEllipseInRect(path, NULL, shapeFrame);
        
        CGFloat colR, colG, colB, colA;
        [SHAPE_FILL getRed:&colR green:&colG blue:&colB alpha:&colA];
        CGContextAddPath(aRef, path);
        CGContextSetRGBFillColor(aRef, colR, colG, colB, colA);
        CGContextFillPath(aRef);
        
        [SHAPE_STROKE getRed:&colR green:&colG blue:&colB alpha:&colA];
        CGContextAddPath(aRef, path);
        CGContextSetRGBStrokeColor(aRef, colR, colG, colB, colA);
        CGContextSetLineWidth(aRef, SHAPE_STROKE_SIZE);
        CGContextStrokePath(aRef);
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
