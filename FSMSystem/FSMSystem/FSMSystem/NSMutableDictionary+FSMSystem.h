//
//  NSMutableDictionary+FSMSystem.h
//  FSMSystem
//
//  Created by Jcc on 2018/2/2.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (FSMSystem)

- (NSUInteger)stateForTranstion:(NSUInteger)trans;

- (void)setTranstion:(NSUInteger)trans forState:(NSUInteger)stateID;

- (bool)containsTranstion:(NSUInteger)trans;

- (void)removeTransition:(NSUInteger)trans;

@end
