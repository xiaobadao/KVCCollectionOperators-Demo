//
//  ViewController.m
//  KVCCollectionOperators-Demo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Employee.h"

NS_INLINE void MVComputeTimeWithNameAndBlock(const char *caller, void (^block)(void)) {
    CFTimeInterval startTimeInterval = CACurrentMediaTime();
    block();
    CFTimeInterval nowTimeInterval = CACurrentMediaTime();
    NSLog(@"%s - Time Running is: %f", caller, nowTimeInterval - startTimeInterval);
}

#define MVComputeTime(...) MVComputeTimeWithNameAndBlock(__PRETTY_FUNCTION__, (__VA_ARGS__))

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSInteger i=0; i<5; i++) {
        Employee *e1  =[[Employee alloc] init];
        e1.salary = 100+i;
        [mArray addObject:e1];
    }
    double total = 0;
    for (Employee *e1 in mArray) {
        total = e1.salary +total;
    }
    double avgSalary = total/mArray.count;
    NSLog(@"%f-%f",avgSalary,total);
   
    NSLog(@"%@",[mArray valueForKeyPath:@"@avg.salary"]);
    NSLog(@"%@",[mArray valueForKeyPath:@"@min.salary"]);
    NSLog(@"%@",[mArray valueForKeyPath:@"@max.salary"]);
    NSLog(@"%@",[mArray valueForKeyPath:@"@sum.salary"]);
    NSLog(@"%@",[@[@(1),@(2)] valueForKeyPath:@"@max.self"]);

    NSString * attributeName = @"firstName";
    NSString * attributeValue = @"Adam";
    NSPredicate * predicate1;
    
    predicate1 = [NSPredicate predicateWithFormat:@"%K like %@",
     attributeName,attributeValue];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
