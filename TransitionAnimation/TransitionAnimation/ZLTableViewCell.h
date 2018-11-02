//
//  ZLTableViewCell.h
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZLTableViewCell;
@protocol ZLTableViewCellDelegate <NSObject>
@optional
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(ZLTableViewCell *)cell;
@end

@interface ZLTableViewCell : UITableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview;

@property(nonatomic, strong)NSArray *items;

@property(nonatomic,weak) id <ZLTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
