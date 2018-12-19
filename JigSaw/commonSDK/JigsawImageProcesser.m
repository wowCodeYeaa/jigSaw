//
//  JigsawImageProcesser.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/11/14.
//  Copyright © 2018 jianfang zhang. All rights reserved.
//

#define MAX_SEG_IMG_COUNT 30

#import "JigsawImageProcesser.h"

@implementation JigsawImageProcesser

- (void)imageSegmentByOriginImage:(NSString *)originalImg
                     segmentCount:(NSUInteger)count
                  completionBlock:(void(^)(NSError *error, NSArray *segmentImgs))completionBlock
{
    if (nil == originalImg)
    {
        if (completionBlock)
        {
            NSError *err = [NSError errorWithDomain:SEGMENT_ERROR_DOMAIN
                                               code:segmentImageErrorNoImage
                                           userInfo:nil];
            completionBlock(err, nil);
            return;
        }
    }
    
    if ([self isIllegalSegImgCount:count])
    {
        NSError *err = [NSError errorWithDomain:SEGMENT_ERROR_DOMAIN
                                           code:segmentImageErrorSegCountErr
                                       userInfo:nil];
        completionBlock(err, nil);
        return;
    }
    
    
}

#pragma mark - inner methods

- (BOOL)isIllegalSegImgCount:(NSUInteger)count
{
    //TODO judge if illegal
    return NO;
}

@end


