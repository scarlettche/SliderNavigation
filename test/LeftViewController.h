//
//  LeftViewController.h
//  数据结构
//
//  Created by 车雨欣 on 15/4/20.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftViewController;
@protocol LeftViewControllerDelegate <NSObject>

@optional

- (void)pushControllerToCenterPanel:(LeftViewController *)leftViewController withTargetController:(Class)targetVc;

@end
@interface LeftViewController : UIViewController
@property (nonatomic, weak)id<LeftViewControllerDelegate> delegate;
@end
