//
//  ReadyState.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/3.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "ReadyState.h"

@implementation ReadyState

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stateID = StateIDReady;
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
