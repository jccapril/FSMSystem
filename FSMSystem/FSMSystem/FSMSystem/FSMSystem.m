//
//  FSMSystem.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/2.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "FSMSystem.h"



@implementation FSMState



- (instancetype)init {
    self = [super init];
    if (self) {
        _map = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addTransition:(Transition)trans toStateID:(StateID)stateID {
    
     // Check if anyone of the args is invalid
    if (trans == NullTransition) {
        NSLog(@"FSMState ERROR: NullTransition is not allowed for a real transition");
        return;
    }
    
    if (stateID == NullStateID) {
        NSLog(@"FSMState ERROR: NullStateID is not allowed for a real ID");
        return;
    }
    
    // Since this is a Deterministic FSM,
    //   check if the current transition was already inside the map
   
    if ([_map containsTranstion:trans]) {
        NSLog(@"FSMState ERROR: State %ld already has transition %ld Impossible to assign to another state",trans, stateID);
    }

    [_map setTranstion:trans forState:stateID];
    
}


- (void)deleteTransition:(Transition)trans {
    
    // Check for NullTransition
    if (trans == NullTransition)
    {
        NSLog(@"FSMState ERROR: NullTransition is not allowed");
        return;
    }

    if ([_map containsTranstion:trans]) {
        
        [_map removeTransition:trans];
        
        return;
    }
    
      NSLog(@"FSMState ERROR: Transition %ld passed to %ld was not on the state's transition list",trans, _stateID);
    
}

- (StateID)getOutputStateForTransition:(Transition)trans {
    
    if ([_map containsTranstion:trans]) {
        
        return [_map stateForTranstion:trans];
        
    }
    return NullStateID;
}

- (void)stateWillEnter {
    
    NSLog(@"state %ld willEnter",_stateID);
    
}
- (void)stateWillLeave {
    NSLog(@"state %ld willLeave",_stateID);
}
- (void)reason {}
- (void)act {}

@end

@interface FSMSystem()
@property (nonatomic, strong)NSMutableArray<FSMState*> *states;

@end

@implementation FSMSystem

- (instancetype)init {
    
    if (self = [super init]) {
        _states = [NSMutableArray array];
    }
    return self;
}

- (void)addState:(FSMState *)s {
    
    // Check for Null reference before deleting
    if (s == nil) {
        NSLog(@"FSM ERROR: Null reference is not allowed");
    }
    // First State inserted is also the Initial state,
    //   the state the machine is in when the simulation begins
    if (_states.count == 0) {
        [_states addObject:s];
        _currentState = s;
        _currentStateID = s.stateID;
        [_currentState stateWillEnter];
        return;
    }
    
    for (FSMState *state in _states) {
        if (state.stateID == s.stateID) {
            NSLog(@"FSM ERROR: Impossible to add state %ld because state has already been added", s.stateID);
            return;
        }
    }
    [_states addObject:s];
    
}

- (void)deleteState:(StateID)stateID {
    // Check for NullState before deleting
    if (stateID == NullStateID) {
        NSLog(@"FSM ERROR: NullStateID is not allowed for a real state");
        return;
    }
    // Search the List and delete the state if it's inside it
    for (FSMState *state in _states) {
        if (state.stateID == stateID) {
            [_states removeObject:state];
            return;
        }
    }
    NSLog(@"FSM ERROR: Impossible to delete state %ld . It was not on the list of states",stateID);
    
    
}
- (void)performTransition:(Transition)trans {
    
    // Check for NullTransition before changing the current state
    if (trans == NullTransition) {
        NSLog(@"FSM ERROR: State %ld does not have a target state %ld for transition",_currentStateID,trans);
    }
    
    // Check if the currentState has the transition passed as argument
    StateID stateID = [_currentState getOutputStateForTransition:trans];
    if (stateID == NullStateID){
        NSLog(@"FSM ERROR: State %ld does not have a target state %ld for transition",_currentStateID, trans);
        return;
    }
     // Update the currentStateID and currentState
    _currentStateID = stateID;
    
    for (FSMState *state in _states) {
        if (state.stateID == _currentStateID) {
            // Do the post processing of the state before setting the new one
            [_currentState stateWillLeave];
            
            _currentState = state;
            
            // Reset the state to its desired condition before it can reason or act
            [_currentState stateWillEnter];
            break;
        }
    }
    
    
}// PerformTransition()


@end




