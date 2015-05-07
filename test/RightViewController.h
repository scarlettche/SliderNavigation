//
//  RightViewController.h
//  test
//
//  Created by 车雨欣 on 15/4/27.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RightViewController;
@protocol RightViewControllerDelegate <NSObject>

@required
///在控制器容器中移除搜索控制器
- (void)removeRightViewController:(RightViewController *)rightVc;

@end
@interface RightViewController : UIViewController
@property (nonatomic, weak) id<RightViewControllerDelegate> delegate;
@end
