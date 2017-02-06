//
//  SDWebImageTools.h
//  MVVMoudle
//
//  Created by YX on 2017/1/12.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface SDWebImageTools : NSObject

/// 下载成功后缓存图片。
/// 回调都在主线程中。
+ (void)SDWebImageFromUrl:(NSString *)urlStr progress:(void (^) (NSInteger receivedSize, NSInteger expectedSize))aProgressBlock  success:(void (^) (UIImage *image))aSuccessBlock;

@end
