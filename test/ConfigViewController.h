//
//  ConfigViewController.h
//  test
//
//  Created by 车雨欣 on 15/5/6.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ConfigViewController;
@protocol ConfigViewControllerDelegate <NSObject>

- (void)moveCenterPanelFromConfig:(ConfigViewController *)configVc;

@end

@interface ConfigViewController : UITableViewController
@property (nonatomic, weak) id<ConfigViewControllerDelegate> delegate;
@end
