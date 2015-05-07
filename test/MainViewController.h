//
//  MainViewController.h
//  test
//
//  Created by 车雨欣 on 15/4/27.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@protocol MainViewControllerDelegate <NSObject>

@required
/**
 *  功能：加载搜索页面
 */
- (void)moveRightViewControllerToCenter:(MainViewController *)mainVc;
/**
 *  功能：移动中间面板
 */
- (void)moveCenterPanelFromMain:(MainViewController *)mainVc;
@end

@interface MainViewController : UIViewController
@property (nonatomic, weak)id<MainViewControllerDelegate> delegate;
@end
