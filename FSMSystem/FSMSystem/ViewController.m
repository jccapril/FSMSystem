//
//  ViewController.m
//  FSMSystem
//
//  Created by Jcc on 2018/2/2.
//  Copyright © 2018年 Jcc. All rights reserved.
//

#import "ViewController.h"
#import "SitUpState.h"
#import "SitDownState.h"
#import "ReadyState.h"
#import "GameOverState.h"
#import "StartState.h"
#import "FSMSystem.h"
@interface ViewController ()
@property (nonatomic, strong)FSMSystem *fsm;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self registerFsm];
   
}


- (void)registerFsm {
    
    self.fsm = [[FSMSystem alloc] init];
    
    // 站起状态 --> 坐下 -—-> 坐下状态
    SitUpState *sitUpState = [[SitUpState alloc] init];
    [sitUpState addTransition:TransitionSitDown toStateID:StateIDSitDown];
    [self.fsm addState:sitUpState];

    
     // 坐下状态 --> 站起 -—-> 站起状态
     // 坐下状态 --> 准备 -—-> 准备状态
    SitDownState *sitDownState = [[SitDownState alloc] init];
    [sitDownState addTransition:TransitionSitUp toStateID:StateIDSitUp];
    [sitDownState addTransition:TransitionReady toStateID:StateIDReady];
    [self.fsm addState:sitDownState];
    
    
    // 准备状态 --> 准备(取消准备) -—-> 坐下状态
    // 准备状态 --> 站起 -—-> 站起状态
    // 准备状态 --> 开始 -—-> 开始状态
    ReadyState *readyState = [[ReadyState alloc] init];
    [readyState addTransition:TransitionReady toStateID:StateIDSitDown];
    [readyState addTransition:TransitionSitUp toStateID:StateIDSitUp];
    [readyState addTransition:TransitionStart toStateID:StateIDStart];
    [self.fsm addState:readyState];
    
     // 开始状态 --> 结束 -—-> 坐下状态
    StartState *startState = [[StartState alloc] init];
    [startState addTransition:TransitionGameOver toStateID:StateIDSitDown];
    [self.fsm addState:startState];
    
   
    
}
- (IBAction)btn1CLick:(id)sender {
    
    [self.fsm performTransition:TransitionSitDown];
    
}
- (IBAction)btn2Click:(id)sender {
    
    [self.fsm performTransition:TransitionSitUp];
    
}
- (IBAction)btn3Click:(id)sender {
    
    [self.fsm performTransition:TransitionReady];
  
}
- (IBAction)btn4Click:(id)sender {

    [self.fsm performTransition:TransitionStart];
    
}
- (IBAction)btn5Click:(id)sender {
    
    [self.fsm performTransition:TransitionGameOver];
 
}



@end
