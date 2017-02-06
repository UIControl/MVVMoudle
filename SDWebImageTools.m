//
//  SDWebImageTools.m
//  MVVMoudle
//
//  Created by YX on 2017/1/12.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "SDWebImageTools.h"
#import "SDWebImageDownloader.h"
#import "SDImageCache.h"

@implementation SDWebImageTools

+ (void)SDWebImageFromUrl:(NSString *)urlStr progress:(void (^)(NSInteger, NSInteger))aProgressBlock success:(void (^)(UIImage *))aSuccessBlock
{
    UIImage *imageFromCache = [[SDImageCache sharedImageCache] imageFromCacheForKey:urlStr];
    if (imageFromCache) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (aSuccessBlock)
                aSuccessBlock(imageFromCache);
        });
    }else {
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:urlStr] options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            if (aProgressBlock)
                aProgressBlock(receivedSize, expectedSize);
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [[SDImageCache sharedImageCache] storeImage:image forKey:urlStr completion:nil];
            });
            dispatch_async(dispatch_get_main_queue(), ^{
                if (aSuccessBlock)
                    aSuccessBlock(imageFromCache);
            });
        }];
    }
}

@end
