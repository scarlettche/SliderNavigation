//
//  MenuTableViewCell.h
//  数据结构
//
//  Created by 车雨欣 on 15/4/21.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Menu;
@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) Menu *menuItem;

@end
