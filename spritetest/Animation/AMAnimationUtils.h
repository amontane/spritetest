//
//  AMAnimationUtils.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 29/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AMAnimationTypeRotate,
    AMAnimationTypeOffsetY
} AMAnimationType;

@interface AMAnimationUtils : NSObject

+ (AMAnimationType)animationTypeWithOperation:(NSString *)str;

@end
