//
//  CollectionViewCell.h
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

- (void)setCurrentName:(NSString *)name isSelected:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END
