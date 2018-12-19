//
//  JigsawConfigTableViewCell.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/18.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawConfigTableViewCell.h"

#define TITLE_LABEL_FONT ([UIFont systemFontOfSize:17.0f])
#define TITLE_LABEL_COLOR ([UIColor blackColor])

@implementation JigsawConfigTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    _titleLabel.text = @"";
}

- (UILabel *)titleLabel
{
    if (nil == _titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = TITLE_LABEL_FONT;
        _titleLabel.textColor = TITLE_LABEL_COLOR;
    }
    return _titleLabel;
}

@end
