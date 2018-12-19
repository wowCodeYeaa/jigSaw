//
//  JigsawImagePickerViewController.h
//  JigSaw
//
//  Created by jianfang zhang on 2018/7/4.
//  Copyright © 2018年 jianfang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JigsawImagePickerViewController;
@protocol JigsawImgPickerCtrlDelegate
 @required
/**
 完成图片的选取后的回调

 @param jigsawImgPickerCtrl 图片选取pickerController
 @param img 选取到的图片
 */
- (void)jigsawImgPickCtrl:(JigsawImagePickerViewController *)jigsawImgPickerCtrl
         didFinishPickImg:(UIImage *)img;
@end


@interface JigsawImagePickerViewController : UIImagePickerController
@property (nonatomic, weak) id<JigsawImgPickerCtrlDelegate> imgPickerDelegate;
@end
