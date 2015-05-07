//
//  MenuTableViewCell.m
//  数据结构
//
//  Created by 车雨欣 on 15/4/21.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "Menu.h"

@interface MenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblView;

@end
@implementation MenuTableViewCell

- (void)layoutSubviews{
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setMenuItem:(Menu *)menuItem{
    
    _menuItem = menuItem;
    
    self.imgView.image = [UIImage imageNamed:menuItem.icon];

    self.lblView.text = menuItem.title;
    
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected == NO) {
        self.imgView.image = [UIImage imageNamed:self.menuItem.icon];
    }else {
        self.imgView.image = [UIImage imageNamed:self.menuItem.icon_hl];
    }
    
}

@end
