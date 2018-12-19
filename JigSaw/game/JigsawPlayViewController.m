//
//  JigsawPlayViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/18.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawPlayViewController.h"

@interface JigsawPlayViewController ()
@property (nonatomic, assign) NSUInteger gameLevel;
@end

@implementation JigsawPlayViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    //默认初始化方法从第一关开始进行
    return [self initWithLevel:1];
}

- (instancetype)initWithLevel:(NSUInteger)level
{
    if (self = [self initWithNibName:nil bundle:nil]) {
        _gameLevel = level;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark inner functions

- (void)initializeSubViews
{
    
}

- (void)initializedData
{
    
}


@end
