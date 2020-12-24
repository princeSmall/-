//
//  CollectionView.h
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol collectionTouchDelegate <NSObject>

- (void)controlScrollViewContentOffset:(NSInteger)inde;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CollectionView : UICollectionView
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, weak) id<collectionTouchDelegate> touchDelegate;
@end

NS_ASSUME_NONNULL_END
