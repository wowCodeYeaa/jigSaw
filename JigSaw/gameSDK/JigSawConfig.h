//
//  JigSawConfig.h
//  JigSaw
//
//  Created by jianfang zhang on 2018/8/15.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, JigSawLevel)
{
    JigSawLevelEasy,
    JigSawLevelNormal,
    JigSawLevelHard
};

@interface JigSawConfig : NSObject
@property (nonatomic, assign) NSInteger gameTime; //游戏时间,范围30-300秒
@property (nonatomic, assign) JigSawLevel gameLevel;
@end
