//
//  JigsawSegmentImgShowViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/7/7.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawSegmentImgShowViewController.h"

#define segment_row_count 3
#define segment_column_count 3

@interface JigsawSegmentImgShowViewController ()
@property (nonatomic, strong) NSMutableArray<UIImage *> * imgList;
@property (nonatomic, assign) NSInteger segRow;
@property (nonatomic, assign) NSInteger segcolumn;
@end

@implementation JigsawSegmentImgShowViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithOriginImg:nil segRow:0 segColumn:0];
}

- (instancetype)initWithOriginImg:(UIImage *)img segRow:(NSInteger)row segColumn:(NSInteger)column
{
    if (self = [super init]) {
        _imgList = [NSMutableArray array];
        _segRow = row;
        _segcolumn = column;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showImgList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark inner functions

- (void)initSubViews
{
    
}

- (void)initializeData
{
    
}

- (void)showImgList
{
    if (0 == _imgList.count)
    {
        NSLog(@"imglist is empty!");
        return;
    }
    CGFloat width = self.view.bounds.size.width/segment_row_count;
    CGFloat height = self.view.bounds.size.height/segment_column_count;
    CGRect rect = CGRectMake(0, 0, width, height);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:rect];
    [self.view addSubview:imgView];
    [_imgList enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj,
                                           NSUInteger idx,
                                           BOOL * _Nonnull stop) {
        imgView.image = obj;
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
