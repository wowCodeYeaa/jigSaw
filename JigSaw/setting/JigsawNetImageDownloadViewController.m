//
//  JigsawNetImageDownloadViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/9/3.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//


#define url_text_field_width 300
#define url_text_field_height 80


#import "JigsawNetImageDownloadViewController.h"

@interface JigsawNetImageDownloadViewController ()
@property (nonatomic, strong) UITextField *netUrlTextField;
@property (nonatomic, strong) UIButton *downloadBtn;
@end

@implementation JigsawNetImageDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.netUrlTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark inner functions

- (UITextField *)netUrlTextField
{
    if (nil == _netUrlTextField)
    {
        CGRect urlTestFieldFrame = CGRectMake((CGRectGetWidth(self.view.bounds) - url_text_field_width)/2,
                                              (CGRectGetHeight(self.view.bounds) - url_text_field_height)/2,
                                              url_text_field_width,
                                              url_text_field_height);
        _netUrlTextField = [[UITextField  alloc] initWithFrame:urlTestFieldFrame];
    }
    return _netUrlTextField;
}

@end
