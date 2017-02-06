//
//  TestHomeModel.m
//  MVVMoudle
//
//  Created by YX on 2017/1/11.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "TestHomeModel.h"
#import "ProBasicSimNetworking.h"

@implementation TestHomeModel

- (void)dealloc
{
    NSLog(@"TestHomeModel %@",NSStringFromSelector(_cmd));
}

+ (void)fetchDataWithPage:(int)page success:(void (^)(NSArray *))aSuccessBlock
{
    [ProBasicSimNetworking simNetworkingForPage:page withSuccess:aSuccessBlock failed:nil];
}

@end
