//
//  JigSawConfig.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/8/15.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigSawConfig.h"

@implementation JigSawConfig

- (void)encodeWithCoder:(NSCoder *)aCoder;
{
    [aCoder encodeInteger:_gameTime forKey:@"gameTime"];
    [aCoder encodeInteger:_gameLevel forKey:@"gameLevel"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _gameTime = [aDecoder decodeIntegerForKey:@"gameTime"];
        _gameLevel = [aDecoder decodeIntegerForKey:@"gameLevel"];
    }
    return self;
}

@end
