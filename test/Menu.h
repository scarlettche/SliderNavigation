//
//  Menu.h
//  数据结构
//
//  Created by 车雨欣 on 15/4/21.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *icon_hl;
@property (nonatomic, assign) Class targetVc;

+ (instancetype) menuWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;
@end
