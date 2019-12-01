//
//  AMAnimationDescription.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 29/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMAnimationDescription.h"
#import "AMAnimationUtils.h"

@implementation AMAnimationDescription

- (id)initWithBodyPart:(AMBodyPart *)part type:(AMAnimationType)type amount:(CGFloat)amount duration:(CGFloat)duration {
    self = [super init];
    if (self) {
        self.bodyPart = part;
        self.type = type;
        self.amount = amount;
        self.duration = duration;
        self.numIterations = 1;
        self.startPosition = nil;
    }
    return self;
}

- (void)configureStartPosition {
    self.startPosition = [NSNumber numberWithFloat:[self.bodyPart storedAmountForAnimationType:self.type]];
}

@end
