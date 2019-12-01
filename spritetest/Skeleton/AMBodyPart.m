//
//  AMBodyPart.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 16/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMBodyPart.h"
#import "AMSkeletonConstants.h"
#import "AMSkeletonUtils.h"
#import "AMHead.h"
#import "AMLimb.h"

@interface AMBodyPart()

@property (strong, nonatomic) AMBodyPart *attachedBodyPart;
@property (assign, nonatomic) NSInteger originalW;
@property (assign, nonatomic) NSInteger originalH;

@end

@implementation AMBodyPart

#pragma mark - Init

- (id)init {
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
        [self frameChange];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andType:(AMPartType)type {
    self = [super initWithFrame:frame];
    if (self) {
        _partType = type;
        [self customInit];
        [self frameChange];
    }
    return self;
}

- (void)customInit {
    self.backgroundColor = [UIColor clearColor];
    self.drawShape = YES;
    self.drawJoints = YES;
    self.clipsToBounds = NO;
}

#pragma mark - Static factory

+ (AMBodyPart *)bodyPartWithFrame:(CGRect)frame andType:(AMPartType)type {
    AMBodyPart * part = nil;
    if (type == AMPartTypeHead) {
        part = [[AMHead alloc] initWithFrame:frame];
    } else if (type == AMPartTypeLimb) {
        part = [[AMLimb alloc] initWithFrame:frame];
    } else if (type == AMPartTypeLeftFoot) {
        
    } else if (type == AMPartTypeRightFoot) {
        
    } else if (type == AMPartTypeHand) {
        
    }
    return part;
}

#pragma mark - Property override
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self frameChange];
}

- (void)setPartType:(AMPartType)partType {
    _partType = partType;
    [self frameChange];
}

#pragma mark - Drawing

- (void)frameChange {
    self.originalH = self.frame.size.height;
    self.originalW = self.frame.size.width;
    [self calculateJoints];
    [self calculateShapePath];
}

- (void)calculateShapePath {
    self.shape = [UIBezierPath bezierPath];
    [self.shape moveToPoint:self.originJoint];
    [self.shape addLineToPoint:self.endJoint];
    [self.shape closePath];
}

- (void)drawRect:(CGRect)rect {
    if (self.drawJoints) {
        if (!CGPointEqualToPoint(CGPointZero, self.originJoint)) {
            [AMSkeletonUtils drawJointInPoint:self.originJoint];
        }
        if (!CGPointEqualToPoint(CGPointZero, self.endJoint)) {
            [AMSkeletonUtils drawJointInPoint:self.endJoint];
        }
    }
}

#pragma mark - Method implementation

- (void)rotateDegrees:(CGFloat)degrees interval:(CGFloat)interval {
    [self rotateDegrees:degrees interval:interval onFinished:nil];
}

- (void)rotateDegrees:(CGFloat)degrees interval:(CGFloat)interval onFinished:(void (^)(bool finished))completion{
    self.degrees = degrees;
    [UIView animateWithDuration:interval delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
        CGAffineTransform transf = CGAffineTransformMakeTranslation([self rotateOffsetX], [self rotateOffsetY]);
        transf = CGAffineTransformConcat(transf, CGAffineTransformMakeRotation(M_PI * degrees / 180));
        transf = CGAffineTransformConcat(transf, CGAffineTransformMakeTranslation(-[self rotateOffsetX], -[self rotateOffsetY]));
        self.transform = transf;
    } completion:^(BOOL finished){
        if (completion != nil) {
            completion(finished);
        }
    }];
}

- (void)attachBodyPart:(AMBodyPart *)bodyPart {
    if (self.attachedBodyPart) {
        [self.attachedBodyPart removeFromSuperview];
    }
    self.attachedBodyPart = bodyPart;
    [AMSkeletonUtils alignBodyPart:self.attachedBodyPart toJoint:self.endJoint];
    [self addSubview:self.attachedBodyPart];
}

- (void)calculateJoints {
    // Empty method, subclasses should implement it
}

- (BOOL)supportsAnimationType:(AMAnimationType)type {
    // Empty method, subclasses should implement it
    return NO;
}
- (void)executeAnimationType:(AMAnimationType)type amount:(CGFloat)amount interval:(CGFloat)interval {
    // Empty method, subclasses should implement it
}

- (CGFloat)storedAmountForAnimationType:(AMAnimationType)type {
    // Empty method, subclasses should implement it
    return 0;
}

#pragma mark - Private

- (CGFloat)rotateOffsetX {
    return (self.originalW / 2) - self.originJoint.x;
}

- (CGFloat)rotateOffsetY {
    return (self.originalH / 2) - self.originJoint.y;
}

@end
