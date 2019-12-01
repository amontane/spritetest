//
//  AMAnimationDescription.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 29/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AMBodyPart.h"
#import "AMAnimationUtils.h"

@interface AMAnimationDescription : NSObject

@property (strong, nonatomic) AMBodyPart *bodyPart;
@property (assign, nonatomic) AMAnimationType type;
@property (assign, nonatomic) CGFloat amount;
@property (assign, nonatomic) CGFloat duration;
@property (assign, nonatomic) NSInteger numIterations;
@property (assign, nonatomic) NSNumber *startPosition;

- (id)initWithBodyPart:(AMBodyPart *)part type:(AMAnimationType)type amount:(CGFloat)amount duration:(CGFloat)duration;
- (void)configureStartPosition;

@end
