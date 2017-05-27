//
//  Person.m
//  runtime-拦截系统自带的方法
//
//  Created by apple on 2017/5/25.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)eat{
    NSLog(@"哥么 吃了");
}
+ (void)sleep{
    NSLog(@"哥么 睡了");
}
- (void)study{
    NSLog(@"小伙儿 在学习");
}
- (void)playGame{
    NSLog(@"小伙儿 在打游戏");
}
@end
