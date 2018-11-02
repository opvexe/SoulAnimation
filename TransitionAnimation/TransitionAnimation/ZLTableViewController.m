//
//  ZLTableViewController.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ZLTableViewController.h"
#import "ZLTransitionViewController.h"
#import "ZLTableViewCell.h"
#import <Masonry.h>
@interface ZLTableViewController ()<UITableViewDelegate,UITableViewDataSource,ZLTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableListView;
@property(nonatomic,strong)NSArray *lists;
@end

@implementation ZLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadConfireView];
    [self loadDataSouce];
}

-(void)loadConfireView{
    _tableListView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        [self.view addSubview:iv];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.dataSource = self;
        iv.delegate = self;
        iv.rowHeight = 280.0f;
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
        iv.tableFooterView  =[UIView new];
        iv.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        iv;
    });
}

-(void)loadDataSouce{
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *s = [NSString stringWithFormat:@"Airbnb0%@", @(i)];
        [arrM addObject:s];
    }
    self.lists = [arrM copy];
    [self.tableListView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZLTableViewCell *cell = [ZLTableViewCell CellWithTableView:tableView];
    cell.items = self.lists;
    cell.delegate = self;
    return cell;
}

#pragma mark <ZLTableViewCellDelegate>
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(ZLTableViewCell *)cell{
    self.currentIndexPath = indexPath;
    ZLTransitionViewController *controller = [[ZLTransitionViewController alloc]init];
    self.navigationController.delegate = controller;
    controller.imageName = self.lists[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
