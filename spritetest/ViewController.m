//
//  ViewController.m
//  spritetest
//
//  Created by Albert Montane Blanchart on 16/04/2018.
//  Copyright © 2018 Albert Montane Blanchart. All rights reserved.
//

#import "ViewController.h"
#import "AMPerson.h"
#import "AMBodyPart.h"
#import "AMAnimationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AMPerson *person = [[AMPerson alloc] init];
    [person setUp:@{
                    AMPersonMoveTorsoYOffset : @0,
                    AMPersonMoveLeftArmRotation : @-30,
                    AMPersonMoveLeftVambraceRotation: @-145,
                    AMPersonMoveRightArmRotation : @-30,
                    AMPersonMoveRightVambraceRotation : @-165,
                    AMPersonMoveLeftHighLegRotation : @-10,
                    AMPersonMoveLeftLowLegRotation : @20,
                    AMPersonMoveRightHighLegRotation : @-10,
                    AMPersonMoveRightLowLegRotation : @20
                    }];
    [self.view addSubview:person];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveRightArmRotation : @-90,
                              AMPersonMoveRightVambraceRotation : @0
                              } inInterval:0.08];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.17 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveRightArmRotation,
                                                   AMPersonMoveRightVambraceRotation] inInterval:0.16];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveRightArmRotation : @-90,
                              AMPersonMoveRightVambraceRotation : @0
                              } inInterval:0.08];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.17 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveRightArmRotation,
                                                   AMPersonMoveRightVambraceRotation] inInterval:0.16];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveRightArmRotation : @-90,
                              AMPersonMoveRightVambraceRotation : @0
                              } inInterval:0.08];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.27 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveRightArmRotation,
                                                   AMPersonMoveRightVambraceRotation] inInterval:0.16];
    });
    
    
    
    //LEGS
    [person moveToState:@{
                          AMPersonMoveTorsoYOffset: @4,
                          AMPersonMoveLeftHighLegRotation : @-15,
                          AMPersonMoveLeftLowLegRotation : @30,
                          AMPersonMoveRightHighLegRotation : @-15,
                          AMPersonMoveRightLowLegRotation : @30
                          } inInterval:0.75];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveTorsoYOffset,
                                                   AMPersonMoveLeftHighLegRotation,
                                                   AMPersonMoveLeftLowLegRotation,
                                                   AMPersonMoveRightHighLegRotation,
                                                   AMPersonMoveRightLowLegRotation] inInterval:0.75];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveTorsoYOffset: @4,
                              AMPersonMoveLeftHighLegRotation : @-15,
                              AMPersonMoveLeftLowLegRotation : @30,
                              AMPersonMoveRightHighLegRotation : @-15,
                              AMPersonMoveRightLowLegRotation : @30
                              } inInterval:0.75];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveTorsoYOffset,
                                                   AMPersonMoveLeftHighLegRotation,
                                                   AMPersonMoveLeftLowLegRotation,
                                                   AMPersonMoveRightHighLegRotation,
                                                   AMPersonMoveRightLowLegRotation] inInterval:0.75];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveTorsoYOffset: @4,
                              AMPersonMoveLeftHighLegRotation : @-15,
                              AMPersonMoveLeftLowLegRotation : @30,
                              AMPersonMoveRightHighLegRotation : @-15,
                              AMPersonMoveRightLowLegRotation : @30
                              } inInterval:0.75];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveTorsoYOffset,
                                                   AMPersonMoveLeftHighLegRotation,
                                                   AMPersonMoveLeftLowLegRotation,
                                                   AMPersonMoveRightHighLegRotation,
                                                   AMPersonMoveRightLowLegRotation] inInterval:0.75];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person moveToState:@{
                              AMPersonMoveTorsoYOffset: @4,
                              AMPersonMoveLeftHighLegRotation : @-15,
                              AMPersonMoveLeftLowLegRotation : @30,
                              AMPersonMoveRightHighLegRotation : @-15,
                              AMPersonMoveRightLowLegRotation : @30
                              } inInterval:0.75];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person resetToInitialPositionOperations:@[AMPersonMoveTorsoYOffset,
                                                   AMPersonMoveLeftHighLegRotation,
                                                   AMPersonMoveLeftLowLegRotation,
                                                   AMPersonMoveRightHighLegRotation,
                                                   AMPersonMoveRightLowLegRotation] inInterval:0.75];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
