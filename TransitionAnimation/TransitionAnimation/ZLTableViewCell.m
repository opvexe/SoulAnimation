//
//  ZLTableViewCell.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLTableViewCell.h"
#import "ZLCollectionViewCell.h"
#import <Masonry.h>
@interface ZLTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@end
@implementation ZLTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"ZLTableViewCell";
    ZLTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _collectionView = ({
            UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
            layout.itemSize = CGSizeMake(250., 250.*2.0/3.0+44.0f);
            layout.minimumInteritemSpacing = 0;
            layout.minimumLineSpacing = 0 ;
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            UICollectionView *iv =[[UICollectionView alloc] initWithFrame:CGRectMake(0,0, 0,0)
                                                   collectionViewLayout:layout];
            iv.backgroundColor = [UIColor whiteColor];
            iv.showsHorizontalScrollIndicator = NO;
            iv.showsVerticalScrollIndicator =NO;
            iv.dataSource = self;
            iv.delegate = self;
            iv.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
            [self.contentView addSubview:iv];
            [iv registerClass:[ZLCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ZLCollectionViewCell class])];
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self.contentView);
            }];
            iv;
        });

    }
    return  self ;
}

-(void)setItems:(NSArray *)items{
    _items = items;
    [self.collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZLCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZLCollectionViewCell class]) forIndexPath:indexPath];
    cell.dataString = self.items[indexPath.row];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelectedItemIndexPath:collcetionView:forCell:)]) {
        [self.delegate collectionViewDidSelectedItemIndexPath:indexPath collcetionView:collectionView forCell:self];
    }
}


@end
