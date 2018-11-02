//
//  ZLCollectionViewCell.h
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)NSString *dataString;

@property(nonatomic,strong)UIImageView *coverImageView;
@end

NS_ASSUME_NONNULL_END
