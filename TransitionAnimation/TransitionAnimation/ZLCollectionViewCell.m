//
//  ZLCollectionViewCell.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLCollectionViewCell.h"
#import <Masonry.h>
@implementation ZLCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        _coverImageView = ({
            UIImageView *iv = [[UIImageView alloc]init];
            [self.contentView addSubview:iv];
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.clipsToBounds = YES;
            iv.layer.masksToBounds = YES;
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.mas_equalTo(self.contentView);
                make.right.mas_equalTo(-20.0f);
            }];
            iv;
        });
    }
    return self;
}


-(void)setDataString:(NSString *)dataString{
    _dataString = dataString;
    NSString *s = [NSString stringWithFormat:@"Airbnb0%@", dataString];
    self.coverImageView.image = [UIImage imageNamed:s];
}

@end
