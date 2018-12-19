//
//  JigsawGuideViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/2.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawGuideViewController.h"
#import "JigsawlevelSelectViewController.h"
#import "JigsawConfigTableViewController.h"

#define START_BTN_WIDTH  100
#define START_BTN_HEIGHT 40

#define GUIDE_VIEW_BTN_V_SPACE  50

#define CONFIG_BTN_WIDTH  100
#define CONFIG_BTN_HEIGHT 40

@interface JigsawGuideViewController ()
{
    dispatch_queue_t testQueue;
}
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *configBtn;
@end

@implementation JigsawGuideViewController

#pragma mark -
#pragma mark life cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    testQueue = dispatch_queue_create("testContent", NULL);
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initializeSubViews];
}

- (void)dealloc
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark inner functions

- (void)initializeSubViews
{
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.configBtn];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"config_back_image"]];
}

- (void)initializeData
{
    
}

- (UIButton *)buttonWithColor:(UIColor *)btnColor
                  normalTitle:(NSString *)normalTitle
               highlightTitle:(NSString *)highlightTitle
                        frame:(CGRect)frame
                       target:(id)target
                       action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = btnColor;
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    [btn setTitle:highlightTitle forState:UIControlStateHighlighted];
    btn.frame = frame;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (UIButton *)startBtn
{
    if (nil == _startBtn)
    {
        CGFloat startY = (CGRectGetHeight(self.view.bounds) - (START_BTN_HEIGHT + GUIDE_VIEW_BTN_V_SPACE + CONFIG_BTN_HEIGHT)) / 2;
        CGRect rect = CGRectMake((CGRectGetWidth(self.view.bounds) - START_BTN_WIDTH)/2,
                                 startY,
                                 START_BTN_WIDTH,
                                 START_BTN_HEIGHT);
        _startBtn = [self buttonWithColor:[UIColor redColor]
                              normalTitle:@"Start"
                           highlightTitle:@"Start"
                                    frame:rect
                                   target:self
                                   action:@selector(startBtnClicked:)];
    }
    return _startBtn;
}

- (void)startBtnClicked:(id)sender
{
    JigsawlevelSelectViewController *levelSelectViewCtrl = [[JigsawlevelSelectViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:levelSelectViewCtrl animated:YES];
}

- (UIButton *)configBtn
{
    if (nil == _configBtn)
    {
        CGFloat configY = (CGRectGetHeight(self.view.bounds) - (START_BTN_HEIGHT + GUIDE_VIEW_BTN_V_SPACE + CONFIG_BTN_HEIGHT)) / 2 + START_BTN_HEIGHT + GUIDE_VIEW_BTN_V_SPACE;
        _configBtn = [self buttonWithColor:[UIColor greenColor]
                               normalTitle:@"Config"
                            highlightTitle:@"Config"
                                     frame:CGRectMake((CGRectGetWidth(self.view.bounds) - CONFIG_BTN_WIDTH)/2,
                                                      configY,
                                                      CONFIG_BTN_WIDTH,
                                                      CONFIG_BTN_HEIGHT)
                                    target:self
                                    action:@selector(configBtnClicked:)];
    }
    return _configBtn;
}

- (void)configBtnClicked:(id)sender
{
    JigsawConfigTableViewController *configTableViewCtrl = [[JigsawConfigTableViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:configTableViewCtrl animated:YES];
}


@end
