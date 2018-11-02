//
//  ZLTransitionAnimation.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLTransitionAnimation.h"

@interface ZLTransitionAnimation ()
@property (nonatomic, assign) ZLTransitionType type;
@end

@implementation ZLTransitionAnimation

+ (instancetype)transitionWithType:(ZLTransitionType)type{
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(ZLTransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

/**
 *  动画时长
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.35;
}

/**
 *  如何执行过渡动画
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case ZLTransitionTypePush:
            [self doPushAnimation:transitionContext];
            break;
            
        case ZLTransitionTypePushPop:
            [self doPopAnimation:transitionContext];
            break;
    }
}

/**
 *  执行push过渡动画
 */
- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    
}

/**
 *  执行pop过渡动画
 */
- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
}
@end
