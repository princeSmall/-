

//
//  CollectionViewCell.m
//  标签
//
//  Created by TongLe on 2020/12/14.
//  Copyright © 2020 TongLe. All rights reserved.
//

#import "CollectionViewCell.h"
@interface CollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
        self.contentView.layer.cornerRadius = 5.f;
        self.contentView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
- (void)setCurrentName:(NSString *)name isSelected:(BOOL)isSelected{
    self.titleLabel.text = name;
    self.titleLabel.textColor = isSelected ? [UIColor redColor] :[UIColor blackColor];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

@end
