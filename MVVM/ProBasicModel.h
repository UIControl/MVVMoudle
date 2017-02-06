//
//  ProBasicModel.h
//  MVVMoudle
//
//  Created by YX on 2017/1/11.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 获取对象的所有属性 */
extern NSArray *allProperties(Class cls);

@interface ProBasicModel : NSObject <NSCopying>

+ (instancetype)pbm_instanceFromResponseDictionary:(NSDictionary *)aDictionary;

- (instancetype)pbm_instanceFromResponseDictionary:(NSDictionary *)aDictionary;

@end
