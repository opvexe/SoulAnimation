//
//  ZLTransitionViewController.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLTransitionViewController.h"
#import "ZLTransitionAnimation.h"
#import <Masonry.h>
@interface ZLTransitionViewController ()

@end

@implementation ZLTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Airbnb01"]];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(320.0f);
    }];
}




- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [ZLTransitionAnimation transitionWithType:operation == UINavigationControllerOperationPush ? ZLTransitionTypePush : ZLTransitionTypePushPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return nil;
}

@end
