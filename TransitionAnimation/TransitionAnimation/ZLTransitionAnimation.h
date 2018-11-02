//
//  ZLTransitionAnimation.h
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZLTransitionType) {
    ZLTransitionTypePush = 0,
    ZLTransitionTypePushPop,
};

@interface ZLTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(ZLTransitionType)type;
@end

NS_ASSUME_NONNULL_END
