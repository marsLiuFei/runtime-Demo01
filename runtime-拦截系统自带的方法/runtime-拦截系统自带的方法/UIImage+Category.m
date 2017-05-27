//
//  UIImage+Category.m
//  runtime-拦截系统自带的方法
//
//  Created by apple on 2017/5/25.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

@implementation UIImage (Category)
+ (UIImage *)LF_imageNamed:(NSString *)name {
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        name = [name stringByAppendingString:@"_change"];
    }
    return [UIImage LF_imageNamed:name];
}


+ (void)load {
    // 获取两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(LF_imageNamed:));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
}


@end
