//
//  GameOverState.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/3.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "GameOverState.h"

@implementation GameOverState


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stateID = StateIDGameOver;
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
