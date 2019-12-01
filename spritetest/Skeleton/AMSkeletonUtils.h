//
//  AMSkeletonUtils.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 17/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AMBodyPart.h"

@interface AMSkeletonUtils : NSObject

+ (void)drawJointInPoint:(CGPoint)p;
+ (void)alignBodyPart:(AMBodyPart *)bodyPart toJoint:(CGPoint)joint;

@end
