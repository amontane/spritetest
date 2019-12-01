//
//  AMHead.h
//  spritetest
//
//  Created by Albert Montane Blanchart on 18/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "AMBodyPart.h"

@interface AMHead : AMBodyPart

- (void)rotateDegrees:(CGFloat)degrees interval:(CGFloat)interval;
- (void)rotateDegrees:(CGFloat)degrees interval:(CGFloat)interval onFinished:(void (^)(bool finished))completion;

@end
