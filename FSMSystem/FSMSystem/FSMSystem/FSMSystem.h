//
//  FSMSystem.h
//  FSMSystem
//
//  Created by Jcc on 2018/2/2.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSMutableDictionary+FSMSystem.h"
@class FSMSystem;

typedef enum : NSUInteger {
    
    NullTransition = 0, // Use this transition to represent a non-existing transition in your system
    TransitionSitUp,
    TransitionSitDown,
    TransitionReady,
    TransitionStart,
    TransitionGameOver,
    
} Transition;


/// <summary>
/// Place the labels for the States in this enum.
/// Don't change the first label, NullTransition as FSMSystem class uses it.
/// </summary>
typedef enum : NSUInteger {

    NullStateID = 0, // Use this transition to represent a non-existing transition in your system
    StateIDSitUp,
    StateIDSitDown,
    StateIDReady,
    StateIDStart,
    StateIDGameOver,
    
} StateID;


/// <summary>
/// This class represents the States in the Finite State System.
/// Each state has a Dictionary with pairs (transition-state) showing
/// which state the FSM should be if a transition is fired while this state
/// is the current state.
/// Method Reason is used to determine which transition should be fired .
/// Method Act has the code to perform the actions the NPC is supposed do if it's on this state.
/// </summary>
@interface FSMState : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary<NSNumber*, NSNumber*> *map;
@property (nonatomic, assign) StateID stateID;




- (void)addTransition:(Transition)trans toStateID:(StateID)stateID;

// <summary>
/// This method deletes a pair transition-state from this state's map.
/// If the transition was not inside the state's map, an ERROR message is printed.
/// </summary>
- (void)deleteTransition:(Transition)trans;

/// <summary>
/// This method returns the new state the FSM should be if
///    this state receives a transition and
/// </summary>
- (StateID)getOutputStateForTransition:(Transition)trans;

/// <summary>
/// This method is used to set up the State condition before entering it.
/// It is called automatically by the FSMSystem class before assigning it
/// to the current state.
/// </summary>
- (void)stateWillEnter;

/// <summary>
/// This method is used to make anything necessary, as reseting variables
/// before the FSMSystem changes to another one. It is called automatically
/// by the FSMSystem before changing to a new state.
/// </summary>
- (void)stateWillLeave;

/// <summary>
/// This method decides if the state should transition to another on its list
/// </summary>
- (void)reason;

/// <summary>
/// This method controls the behavior of the NPC in the game World.
/// </summary>

- (void)act;



@end



/// <summary>
/// FSMSystem class represents the Finite State Machine class.
///  It has a List with the States the NPC has and methods to add,
///  delete a state, and to change the current state the Machine is on.
/// </summary>
@interface FSMSystem : NSObject

// The only way one can change the state of the FSM is by performing a transition
// Don't change the CurrentState directly
@property (nonatomic, assign, readonly)StateID currentStateID;
@property (nonatomic, strong, readonly)FSMState *currentState;

/// <summary>
/// This method places new states inside the FSM,
/// or prints an ERROR message if the state was already inside the List.
/// First state added is also the initial state.
/// </summary>
- (void)addState:(FSMState *)s;

/// <summary>
/// This method delete a state from the FSM List if it exists,
///   or prints an ERROR message if the state was not on the List.
/// </summary>
- (void)deleteState:(StateID)stateID;

/// <summary>
/// This method tries to change the state the FSM is in based on
/// the current state and the transition passed. If current state
///  doesn't have a target state for the transition passed,
/// an ERROR message is printed.
/// </summary>
- (void)performTransition:(Transition)trans;

@end









