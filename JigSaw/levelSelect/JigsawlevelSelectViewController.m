//
//  JigsawlevelSelectViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/2.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawlevelSelectViewController.h"
#import "JigsawLevelSelectTableViewDataSource.h"
#import "JigsawLevelSelectTableViewDelegate.h"
#import "JigsawLevelSelectTableViewCell.h"

@interface JigsawlevelSelectViewController ()
@property (nonatomic, strong) UITableView *levelSelectTableView;
@property (nonatomic, strong) JigsawLevelSelectTableViewDataSource *levelSelectDataSource;
@property (nonatomic, strong) JigsawLevelSelectTableViewDelegate *levelSelectDelegate;
@property (nonatomic, weak) NSObject *objObserver;
@end

@implementation JigsawlevelSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关卡选择";
    [self initializeSubView];
    NSObject *obj = [[NSObject alloc] init];
    _objObserver = obj;
    NSLog(@"obj viewdidload is:%@", _objObserver);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"obj viewwillappear is:%@", _objObserver);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"obj viewdidappear is:%@", _objObserver);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark inner functions

- (void)initializeSubView
{
    //FOR CELL REUSE
    [self.levelSelectTableView registerClass:[JigsawLevelSelectTableViewCell class]
                      forCellReuseIdentifier:NSStringFromClass([JigsawLevelSelectTableViewCell class])];
    [self.view addSubview:self.levelSelectTableView];
}

- (JigsawLevelSelectTableViewDelegate *)levelSelectDelegate
{
    if (nil == _levelSelectDelegate)
    {
        _levelSelectDelegate = [[JigsawLevelSelectTableViewDelegate alloc] init];
    }
    return _levelSelectDelegate;
}

- (JigsawLevelSelectTableViewDataSource *)levelSelectDataSource
{
    if (nil == _levelSelectDataSource)
    {
        _levelSelectDataSource = [[JigsawLevelSelectTableViewDataSource alloc] init];
    }
    return _levelSelectDataSource;
}

- (UITableView *)levelSelectTableView
{
    if (nil == _levelSelectTableView)
    {
        _levelSelectTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _levelSelectTableView.delegate = self.levelSelectDelegate;
        _levelSelectTableView.dataSource = self.levelSelectDataSource;
        _levelSelectTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _levelSelectTableView;
}

@end
