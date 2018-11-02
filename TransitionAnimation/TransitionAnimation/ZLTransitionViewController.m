//
//  ZLTransitionViewController.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLTransitionViewController.h"
#import "ZLTransitionAnimation.h"
@interface ZLTransitionViewController ()

@end

@implementation ZLTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}







- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [ZLTransitionAnimation transitionWithType:operation == UINavigationControllerOperationPush ? ZLTransitionTypePush : ZLTransitionTypePushPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return nil;
}

@end
