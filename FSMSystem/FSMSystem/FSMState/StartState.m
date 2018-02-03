//
//  StartState.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/3.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "StartState.h"

@implementation StartState

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stateID = StateIDStart;
    }
    return self;
}


- (void)stateWillEnter {
    [super stateWillEnter];
    
}

- (void)stateWillLeave {
    [super stateWillLeave];
    
}

@end
