//
//  JigsawConfigTableViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/6/10.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawConfigTableViewController.h"
#import "JigsawConfigTableViewCell.h"
#import "JigsawImagePickerViewController.h"
#import "JigsawSegmentImgShowViewController.h"
#import "JigsawNetImageDownloadViewController.h"
#import "JigsawGameTimeConfigViewController.h"

#define JIGSAW_CONFIG_BASIC_CONFIG_SECTION  0
#define JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION  1

@interface JigsawConfigTableViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, JigsawImgPickerCtrlDelegate>
{
 @private
    JigsawImagePickerViewController *jigsawImagePicker;
}
@property(nonatomic, strong) NSMutableDictionary *configDescriptionDic;  //设置描述内容字典 key:indexPath value:描述的内容
@end

@implementation JigsawConfigTableViewController

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeSubViews];
    [self initializeData];
}

- (void)initializeSubViews
{
//    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    backImageView.image = [UIImage imageNamed:@"config_back_image"];
//    [self.view addSubview:backImageView];
    
    [self.tableView registerClass:[JigsawConfigTableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([JigsawConfigTableViewCell class])];
    jigsawImagePicker = [[JigsawImagePickerViewController alloc] init];
    jigsawImagePicker.imgPickerDelegate = self;
}

- (void)initializeData
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark inner methods

- (NSMutableDictionary *)configDescriptionDic
{
    if (nil == _configDescriptionDic)
    {
        NSIndexPath *indexPathRow0Section0 = [NSIndexPath indexPathForRow:0
                                                                inSection:JIGSAW_CONFIG_BASIC_CONFIG_SECTION];
        NSIndexPath *indexPathRow1Section0 = [NSIndexPath indexPathForRow:1
                                                                inSection:JIGSAW_CONFIG_BASIC_CONFIG_SECTION];
        NSIndexPath *indexPathRow0Section1 = [NSIndexPath indexPathForRow:0
                                                                inSection:JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION];
        NSIndexPath *indexPathRow1Section1 = [NSIndexPath indexPathForRow:1
                                                                inSection:JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION];
        NSIndexPath *indexPathRow1Section2 = [NSIndexPath indexPathForRow:2
                                                                inSection:JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION];
        _configDescriptionDic = [NSMutableDictionary dictionary];
        [_configDescriptionDic setObject:@"游戏时间设置" forKey:indexPathRow0Section0];
        [_configDescriptionDic setObject:@"游戏难度设置" forKey:indexPathRow1Section0];
        [_configDescriptionDic setObject:@"拍照选取" forKey:indexPathRow0Section1];
        [_configDescriptionDic setObject:@"相册选取" forKey:indexPathRow1Section1];
        [_configDescriptionDic setObject:@"获取原始图片" forKey:indexPathRow1Section2];
    }
    return _configDescriptionDic;
}

#pragma mark -
#pragma mark JigsawImgPickerCtrlDelegate

- (void)jigsawImgPickCtrl:(JigsawImagePickerViewController *)jigsawImgPickerCtrl
         didFinishPickImg:(UIImage *)img
{
    if (nil == img)
    {
        NSLog(@"img is empty, ignore!");
        return;
    }

    //CGImageRef *imgRef =CGImageCreateWithImageInRect(<#CGImageRef  _Nullable image#>, <#CGRect rect#>)
    //对获取到的图片弹出到新的Controller做编辑和切割处理  初步使用系统api实现，后续转为opencv metal方式
    //JigsawSegmentImgShowViewController *showImgCtrl = [[JigsawSegmentImgShowViewController  alloc] initWithSegmentImgList:@{img}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (JIGSAW_CONFIG_BASIC_CONFIG_SECTION == section)
    {
        return 2;
    }
    else if (JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION == section)
    {
        return 3;
    }
    else
    {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (JIGSAW_CONFIG_BASIC_CONFIG_SECTION == section)
    {
        return @"基本设置";
    }
    else if (JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION == section)
    {
        return @"画面采集设置";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JigsawConfigTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JigsawConfigTableViewCell class])
                                                            forIndexPath:indexPath];
    if (nil == cell)
    {
        cell = [[JigsawConfigTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([JigsawConfigTableViewCell class])];
    }
    cell.titleLabel.text = [self.configDescriptionDic objectForKey:indexPath];
    return cell;
}

#pragma mark -
#pragma mark UIImagePicker

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (JIGSAW_CONFIG_BASIC_CONFIG_SECTION == indexPath.section)
    {
        if (0 == indexPath.row)//游戏时间设置
        {
            JigsawGameTimeConfigViewController *gameTimePicker = [[JigsawGameTimeConfigViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController presentViewController:gameTimePicker animated:YES completion:nil];
            
        }
    }
    else if (JIGSAW_CONFIG_PICTURE_CAPTURE_SECTION == indexPath.section)
    {
        if (0 == indexPath.row)//拍照选取
        {
            jigsawImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.navigationController presentViewController:jigsawImagePicker
                                                    animated:YES
                                                  completion:nil];
        }
        else if (1 == indexPath.row)//相册选取
        {
            jigsawImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.navigationController presentViewController:jigsawImagePicker
                                                    animated:YES
                                                  completion:nil];
        }
        else if (2 == indexPath.row)
        {
            JigsawNetImageDownloadViewController *netImageDownloadController = [[JigsawNetImageDownloadViewController alloc] init];
            [self.navigationController presentViewController:netImageDownloadController
                                                    animated:YES
                                                  completion:nil];
            
        }
        
    }
}


//CGImageCreateWithImageInRect
@end

