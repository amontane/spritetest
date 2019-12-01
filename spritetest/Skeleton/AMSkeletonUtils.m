//
//  AMSkeletonUtils.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 17/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMSkeletonUtils.h"
#import "AMSkeletonConstants.h"

@implementation AMSkeletonUtils

+ (void)drawJointInPoint:(CGPoint)p {
    CGFloat top = p.y - JOINT_RADIUS;
    CGFloat left = p.x - JOINT_RADIUS;
    CGFloat size = JOINT_RADIUS * 2;
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    CGPathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(left,top,size,size));
    
    CGFloat colR, colG, colB, colA;
    [JOINT_COLOR getRed:&colR green:&colG blue:&colB alpha:&colA];
    CGContextAddPath(aRef, path);
    CGContextSetRGBFillColor(aRef, colR, colG, colB, colA);
    CGContextFillPath(aRef);
}

+ (void)alignBodyPart:(AMBodyPart *)bodyPart toJoint:(CGPoint)joint {
    CGFloat finalX, finalY;
    finalX = joint.x - bodyPart.originJoint.x;
    finalY = joint.y - bodyPart.originJoint.y;
    bodyPart.frame = CGRectMake(finalX, finalY, bodyPart.frame.size.width, bodyPart.frame.size.height);
}

@end
