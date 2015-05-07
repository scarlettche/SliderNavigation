//
//  NaviController.m
//  test
//
//  Created by 车雨欣 on 15/4/27.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "NaviController.h"

@interface NaviController ()

@end

@implementation NaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ;
    UINavigationBar *proxy = [UINavigationBar appearance];
//    proxy.backgroundColor = [UIColor colorWithRed:0.592 green:0.000 blue:0.090 alpha:1.000];
//    proxy.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBar64"]];
//    NSDictionary *attr = @{
//                                  NSFontAttributeName = [UIFont systemFontOfSize:19],
//                                  NSBackgroundColorAttributeName = [UIColor whiteColor]
//                                  
//                                  };
    [proxy setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *attr = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:18],
                           NSForegroundColorAttributeName:[UIColor whiteColor],
                           NSBackgroundColorAttributeName:[UIColor whiteColor]
                           
                           };
    
    [proxy setTitleTextAttributes:attr];
    [proxy setTintColor:[UIColor whiteColor]];
    
    
}





@end
