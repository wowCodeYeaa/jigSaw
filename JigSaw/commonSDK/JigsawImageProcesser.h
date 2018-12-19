//
//  JigsawImageProcesser.h
//  JigSaw
//
//  Created by jianfang zhang on 2018/11/14.
//  Copyright © 2018 jianfang zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSString const *segmentImageErrorNoImage = @"segmentImageErrorNoImage";

typedef NS_ENUM(NSInteger, segmentImageError)
{
    segmentImageErrorNoImage,
    segmentImageErrorSegCountErr
};

#define SEGMENT_ERROR_DOMAIN  @"com.segmentImage.error"

NS_ASSUME_NONNULL_BEGIN

@interface JigsawImageProcesser : NSObject
- (void)imageSegmentByOriginImage:(NSString *)originalImg
                     segmentCount:(NSUInteger)count
                  completionBlock:(void(^)(NSError *error, NSArray *segmentImgs))completionBlock;
@end

NS_ASSUME_NONNULL_END
