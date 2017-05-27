//
//  ViewController.m
//  runtime-拦截系统自带的方法
//
//  Created by apple on 2017/5/25.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

//#import <objc/message.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myimageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //交换类方法
    Method method1 = class_getClassMethod([Person class], @selector(eat));
    Method method2 = class_getClassMethod([Person class], @selector(sleep));
    method_exchangeImplementations(method1, method2);
    [Person eat];
    [Person sleep];
    
    
    
    //交换实例方法
    Method method3 = class_getInstanceMethod([Person class], @selector(study));
    Method method4 = class_getInstanceMethod([Person class], @selector(playGame));
    method_exchangeImplementations(method3, method4);
    Person *person = [[Person alloc] init];
    [person study];
    [person playGame];
    

    
    
    self.myimageview.image = [UIImage imageNamed:@"xn_share_wx"];
    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
