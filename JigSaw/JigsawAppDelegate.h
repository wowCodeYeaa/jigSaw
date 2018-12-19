//
//  JigsawAppDelegate.h
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/2.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "JigSawConfig.h"

@interface JigsawAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, strong) JigSawConfig *jigsawConfig;

- (void)saveContext;


@end

