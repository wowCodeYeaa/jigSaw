//
//  JigsawImagePickerViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/7/4.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import "JigsawImagePickerViewController.h"

@interface JigsawImagePickerViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation JigsawImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.allowsEditing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    for (id key in [info allKeys])
    {
        id obj = [info objectForKey:key];
        NSLog(@"key is :%@, value is :%@", key, obj);
    }
    
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    if (img)
    {
        [self.imgPickerDelegate jigsawImgPickCtrl:self didFinishPickImg:img];
    }
}

@end
