//
//  ViewController.m
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import "ViewController.h"
#import "CollectionView.h"

@interface ViewController ()

@property (nonatomic, strong) CollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSIndexPath *path = [NSIndexPath indexPathForRow:3 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (CollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
        flow.minimumLineSpacing = 10;
        flow.minimumInteritemSpacing = 10;
        flow.itemSize = CGSizeMake(50, 50);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[CollectionView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) collectionViewLayout:flow];
        _collectionView.bounces = YES;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 50);
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}


@end
