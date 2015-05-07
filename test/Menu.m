//
//  Menu.m
//  数据结构
//
//  Created by 车雨欣 on 15/4/21.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "Menu.h"

@implementation Menu

+ (instancetype) menuWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
    //        [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.icon_hl = dict[@"icon_hl"];
    }
    return self;
}

@end
