//
//  CollectionView.m
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCell.h"


@interface CollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) BOOL isUpdate;
@end

@implementation CollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSInteger currentPage = ((*targetContentOffset).x) / 70;
    self.index = currentPage + 3;
    [self reloadData];
}


#pragma mark -UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    /* 处理当前选择的row */
    [cell setCurrentName:self.dataArray[indexPath.row] isSelected:indexPath.row == self.index];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}


#pragma mark -UICollectionViewDelegate
/*
 * 非展示部分不可点击
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!(indexPath.row < 3 || indexPath.row  > self.dataArray.count -4)) {
        self.index = indexPath.row;
        [self reloadData];
      [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        if (self.touchDelegate && [self.touchDelegate respondsToSelector:@selector(controlScrollViewContentOffset:)]) {
            [self.touchDelegate controlScrollViewContentOffset:self.index - 3];
        }
    }
   
}

#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60, 30);
}

#pragma mark -计算文字长度
- (NSArray *)dataArray{
    if (!_dataArray) {
        /* 占位符：前后留空占位符用于滚动 ，其实可以前后各留一个占位符就行，目前有问题*/
        _dataArray = [NSArray arrayWithObjects:@"",@"",@"",@"相机",@"大光圈",@"人物",@"美景",@"夜景",@"专业",@"", @"",@"",nil];
    }
    return _dataArray;
}

@end
