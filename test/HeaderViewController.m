//
//  HeaderViewController.m
//  test
//
//  Created by 车雨欣 on 15/4/26.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "HeaderViewController.h"

@interface HeaderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *user_icon;

@end

@implementation HeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.user_icon.image = [UIImage imageNamed:@"user_icon"];
    self.view.backgroundColor = [UIColor clearColor];
}


@end
