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
@property(nonatomic,strong)UIButton *closeButton;
@end

@implementation ZLTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self confingViews];
}

-(void)confingViews{
    _closeButton = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btn];
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        [btn setTitle:@"关闭" forState:UIControlStateSelected];
        [btn setTitle:@"关闭" forState:UIControlStateDisabled];
        [btn setTitle:@"关闭" forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
        [btn setTitleColor:[UIColor darkGrayColor]  forState:UIControlStateHighlighted];
        btn.adjustsImageWhenHighlighted =NO;
        btn.showsTouchWhenHighlighted =NO;
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        btn.clipsToBounds  = YES;
        [btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20.0f);
            make.top.mas_equalTo(30.0f);
            make.size.mas_equalTo(CGSizeMake(30.0f, 40.0f));
        }];
        btn;
    });
    
    _imageView = ({
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:iv];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        iv.image = [UIImage imageNamed:self.imageName];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(320.0f);
        }];
        iv;
    });
}

-(void)Click{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [ZLTransitionAnimation transitionWithType:operation == UINavigationControllerOperationPush ? ZLTransitionTypePush : ZLTransitionTypePushPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return nil;
}

@end
