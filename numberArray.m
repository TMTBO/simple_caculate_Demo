//
//  numberArray.m
//  Caculate
//
//  Created by TobyoTenma on 16/4/6.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

#import "numberArray.h"

@implementation numberArray
//重写+allocWithZone方法,创建单例对象
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static id instance = nil;
    if(instance == nil){
        instance = [super allocWithZone:zone];
    }
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //判断 numArr是不是已经存在,如果不存在,就创建一个,如果存在就什么也不做
        if (self.numArr == nil) {
            self.numArr = [NSMutableArray new];
        }
    }
    return self;
}
//创建单例对象方法
+(instancetype)defultNumberArray{
    return [[self alloc] init];
}
@end
