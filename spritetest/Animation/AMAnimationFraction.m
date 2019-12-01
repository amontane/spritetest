//
//  AMAnimationFraction.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 29/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMAnimationFraction.h"
#import "AMBodyPart.h"
#import "AMAnimationUtils.h"
#import "AMAnimationConstants.h"

@interface AMAnimationFraction()

@property (strong, nonatomic) AMBodyPart *bodyPart;
@property (assign, nonatomic) AMAnimationType animationType;
@property (assign, nonatomic) NSInteger fractionNumber;
@property (assign, nonatomic) NSNumber *finalValue;

@end

@implementation AMAnimationFraction

- (void)setDescription:(AMAnimationDescription *)description {
    _animationDescription = description;
    //self.bodyPart = self.animationDescription.bodyPart;
    self.animationType = description.type;
    self.bodyPart = description.bodyPart;
}

- (void)configure {
    if (!self.animationDescription.startPosition) {
        [self.animationDescription configureStartPosition];
    }
    
    if (!self.finalValue) {
        int numFractions = self.animationDescription.duration / ATOMIC_INTERVAL;
        CGFloat totalAmount = self.animationDescription.amount - self.animationDescription.startPosition.floatValue;
        self.finalValue = [NSNumber numberWithFloat: (self.animationDescription.startPosition.floatValue + (self.fractionNumber * totalAmount / numFractions ))];
    }
}

- (void)perform {
    // TODO
}

@end
