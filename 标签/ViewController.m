//
//  ViewController.m
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import "ViewController.h"
#import "CollectionView.h"

@interface ViewController ()<UIScrollViewDelegate,collectionTouchDelegate>{
   NSInteger count;
    CGFloat height;
    CGFloat width;
}

@property (nonatomic, strong) CollectionView *collectionView;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    count = 6;
    height =  self.view.frame.size.height - 200;
    width = self.view.frame.size.width;
    
    [self initScrollView];

    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)initScrollView{
    
    //frame是指可见区域
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    //添加背景色目的是可以看见控件
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //ScrollView的真实大小 count指滑动的页数
    self.scrollView.contentSize = CGSizeMake(width * count, height);
    
    // 针对每个不一样的控制器处理
    for (int i = 0; i < 6 ; i ++ ) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(width * i,300 , width, 100)];
        [self.scrollView addSubview:nameLabel];
        nameLabel.text = [NSString stringWithFormat:@"current-page%d",i];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

// collectionViewDelegate

- (void)controlScrollViewContentOffset:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(width *index, 0) animated:YES];
}
//不要忘记 UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentPage = (scrollView.contentOffset.x) / scrollView.bounds.size.width;
    NSIndexPath *path = [NSIndexPath indexPathForRow:currentPage + 3 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.collectionView.index = currentPage + 3;
    [self.collectionView reloadData];
}

- (CollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
        flow.minimumLineSpacing = 10;
        flow.minimumInteritemSpacing = 10;
        flow.itemSize = CGSizeMake(60, 30);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[CollectionView alloc]initWithFrame:CGRectMake(0,height, width, 50) collectionViewLayout:flow];
        _collectionView.bounces = YES;
        _collectionView.index = 3;
        _collectionView.touchDelegate = self;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.contentSize = CGSizeMake(width * 2, 50);
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}


@end
