//
//  MainViewController.m
//  test
//
//  Created by 车雨欣 on 15/4/27.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *courseTableView;

@end

@implementation MainViewController

- (IBAction)menuClick:(id)sender{
    if ([self.delegate respondsToSelector:@selector(moveCenterPanelFromMain:)]) {
        [self.delegate moveCenterPanelFromMain:self];
    }
}

- (IBAction)searchClick:(UIBarButtonItem *)sender {
    
    if ([self.delegate respondsToSelector:@selector(moveRightViewControllerToCenter:)]) {
        [self.delegate moveRightViewControllerToCenter:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"全部课程";
    
    self.courseTableView.backgroundColor = [UIColor darkGrayColor];

//    self.view.backgroundColor = [UIColor darkGrayColor];
    
}



@end
