//
//  NSMutableDictionary+FSMSystem.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/2.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "NSMutableDictionary+FSMSystem.h"

@implementation NSMutableDictionary (FSMSystem)

- (NSUInteger)stateForTranstion:(NSUInteger)trans {
    
    NSNumber *transNumber = [NSNumber numberWithUnsignedInteger:trans];
    return [[self objectForKey:transNumber] unsignedIntegerValue];
    
}

- (void)setTranstion:(NSUInteger)trans forState:(NSUInteger)stateID {
    
    NSNumber *transNumber = [NSNumber numberWithUnsignedInteger:trans];
    NSNumber *stateNumber = [NSNumber numberWithUnsignedInteger:stateID];
    
    [self setObject:stateNumber forKey:transNumber];
}

- (bool)containsTranstion:(NSUInteger)trans {
    
    NSNumber *transNumber = [NSNumber numberWithUnsignedInteger:trans];
    
    if ([self objectForKey:transNumber] != nil) {
        return YES;
    }else {
        return NO;
    }
    
}

- (void)removeTransition:(NSUInteger)trans {
    
    NSNumber *transNumber = [NSNumber numberWithUnsignedInteger:trans];
    
    [self removeObjectForKey:transNumber];
    
}

@end
