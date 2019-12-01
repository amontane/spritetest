//
//  AMAnimationManager.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 26/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMBodyPart.h"
#import "AMAnimationConstants.h"
#import "AMAnimationUtils.h"
#import "AMAnimationDescription.h"

@interface AMAnimationManager : NSObject

- (void)scheduleAnimation:(AMAnimationDescription *)animation toStartOn:(CGFloat)startTime;

@end
