//
//  AMAnimationUtils.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 29/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMAnimationUtils.h"

@implementation AMAnimationUtils

+ (AMAnimationType)animationTypeWithOperation:(NSString *)str {
    if ([str containsString:@"YOffset"]) {
        return AMAnimationTypeOffsetY;
    }
    return AMAnimationTypeRotate;
}

@end
