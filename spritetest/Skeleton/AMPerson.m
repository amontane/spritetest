//
//  AMPerson.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 19/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMPerson.h"
#import "AMAnimationManager.h"

@interface AMPerson()

@property (strong, nonatomic) AMAnimationManager* animationManager;

@property (strong, nonatomic) AMTorso* torso;
@property (strong, nonatomic) AMBodyPart* leftArm;
@property (strong, nonatomic) AMBodyPart* leftVambrace;
@property (strong, nonatomic) AMBodyPart* rightArm;
@property (strong, nonatomic) AMBodyPart* rightVambrace;
@property (strong, nonatomic) AMBodyPart* leftHighLeg;
@property (strong, nonatomic) AMBodyPart* leftLowLeg;
@property (strong, nonatomic) AMBodyPart* rightHighLeg;
@property (strong, nonatomic) AMBodyPart* rightLowLeg;
@property (strong, nonatomic) AMBodyPart* head;

@property (strong, nonatomic) NSMutableDictionary* initialState;

@end

@implementation AMPerson

- (id)init {
    self = [super init];
    if (self) {
        self.initialState = @{
                              AMPersonMoveTorsoYOffset : @0,
                              AMPersonMoveLeftArmRotation : @15,
                              AMPersonMoveLeftVambraceRotation: @-15,
                              AMPersonMoveRightArmRotation : @-15,
                              AMPersonMoveRightVambraceRotation : @15,
                              AMPersonMoveLeftHighLegRotation : @0,
                              AMPersonMoveLeftLowLegRotation : @0,
                              AMPersonMoveRightHighLegRotation : @0,
                              AMPersonMoveRightLowLegRotation : @0
                              }.mutableCopy;
    }
    return self;
}

- (void)setUp:(NSDictionary *)initialState {
    for (NSString *component in initialState) {
        if ([self.initialState.allKeys containsObject:component]) {
            self.initialState[component] = initialState[component];
        }
    }
    [self setUp];
}

- (void)setUp {
    self.torso = [[AMTorso alloc] initWithFrame:CGRectMake(100, 100, 50, 100)];
    [self addSubview:self.torso];
    
    self.leftArm = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 60) andType:AMPartTypeLimb];
    [self.torso attachToLeftShoulder:self.leftArm];
    
    self.leftVambrace = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 65) andType:AMPartTypeLimb];
    [self.leftArm attachBodyPart:self.leftVambrace];
    
    self.leftHighLeg = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 75) andType:AMPartTypeLimb];
    [self.torso attachToLeftHip:self.leftHighLeg];
    
    self.leftLowLeg = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 75) andType:AMPartTypeLimb];
    [self.leftHighLeg attachBodyPart:self.leftLowLeg];
    
    self.head = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 30, 40) andType:AMPartTypeHead];
    [self.torso attachToNeck:self.head];
    
    self.rightArm = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 60) andType:AMPartTypeLimb];
    [self.torso attachToRightShoulder:self.rightArm];
    
    self.rightVambrace = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 65) andType:AMPartTypeLimb];
    [self.rightArm attachBodyPart:self.rightVambrace];
    
    self.rightHighLeg = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 75) andType:AMPartTypeLimb];
    [self.torso attachToRightHip:self.rightHighLeg];
    
    self.rightLowLeg = [AMBodyPart bodyPartWithFrame:CGRectMake(0, 0, 10, 75) andType:AMPartTypeLimb];
    [self.rightHighLeg attachBodyPart:self.rightLowLeg];
    
    // INITIAL TRANSFORM
    [self resetToInitialPositionInInterval:0];

}

#pragma mark - Immediate moving

- (void)moveToState:(NSDictionary *)state inInterval:(CGFloat)interval {
    for (NSString *component in state) {
        if ([self.initialState.allKeys containsObject:component]) {
            CGFloat amount = ((NSNumber *)state[component]).floatValue;
            [self applyOperation:component amount:amount inInterval:interval];
        }
    }
}

- (void)resetToInitialPositionInInterval:(CGFloat)interval {
    [self moveToState:self.initialState inInterval:interval];
}

- (void)resetToInitialPositionOperations:(NSArray *)operations inInterval:(CGFloat)interval {
    NSMutableDictionary *newState = [[NSMutableDictionary alloc] init];
    for (NSString *operation in operations) {
        newState[operation] = self.initialState[operation];
    }
    [self moveToState:newState inInterval:interval];
}

#pragma mark - Schedule

- (void)scheduleMoveToState:(NSDictionary *)state startOn:(CGFloat)start during:(CGFloat)interval {
    for (NSString *component in state) {
        if ([self.initialState.allKeys containsObject:component]) {
            AMBodyPart *bodyPart = [self bodyPartForOperation:component];
            CGFloat amount = ((NSNumber*)state[component]).floatValue;
            [self applyOperation:component amount:amount inInterval:interval];
        }
    }
}

- (void)scheduleResetToInitialPositionStartOn:(CGFloat)start during:(CGFloat)interval {
    
}

- (void)scheduleResetToInitialPositionOperations:(NSArray *)operations startOn:(CGFloat)start during:(CGFloat)interval {
    
}

#pragma mark - Private methods

- (void)applyOperation:(NSString *)operation amount:(CGFloat)amount inInterval:(CGFloat)interval {
    AMBodyPart *part = [self bodyPartForOperation:operation];
    if (part) {
        AMAnimationType type = [AMAnimationUtils animationTypeWithOperation:operation];
        if ([part supportsAnimationType:type]) {
            [part executeAnimationType:type amount:amount interval:interval];
        }
    }
}

- (AMBodyPart *)bodyPartForOperation:(NSString*)operation {
    if ([operation isEqualToString:AMPersonMoveTorsoYOffset]) {
        return self.torso;
    }
    if ([operation isEqualToString:AMPersonMoveLeftArmRotation]) {
        return self.leftArm;
    }
    if ([operation isEqualToString:AMPersonMoveRightArmRotation]) {
        return self.rightArm;
    }
    if ([operation isEqualToString:AMPersonMoveLeftVambraceRotation]) {
        return self.leftVambrace;
    }
    if ([operation isEqualToString:AMPersonMoveRightVambraceRotation]) {
        return self.rightVambrace;
    }
    if ([operation isEqualToString:AMPersonMoveLeftHighLegRotation]) {
        return self.leftHighLeg;
    }
    if ([operation isEqualToString:AMPersonMoveLeftLowLegRotation]) {
        return self.leftLowLeg;
    }
    if ([operation isEqualToString:AMPersonMoveRightHighLegRotation]) {
        return self.rightHighLeg;
    }
    if ([operation isEqualToString:AMPersonMoveRightLowLegRotation]) {
        return self.rightLowLeg;
    }
    return nil;
}

- (CGFloat)valueForComponent:(NSString*)component {
    return ((NSNumber *)self.initialState[component]).floatValue;
}

@end
