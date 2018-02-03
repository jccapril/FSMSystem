# FSMSystem
Objective 状态机

具体用法见demo，以下是简单的流程：

在FSMSystem.h文件里定义好相关的枚举
````
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

````
Demo:先注册状态机
````
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

````

调用方法切换状态
````
[self.fsm performTransition:TransitionSitDown];
````




