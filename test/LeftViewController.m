//
//  LeftViewController.m
//  数据结构
//
//  Created by 车雨欣 on 15/4/20.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "LeftViewController.h"
#import "Menu.h"
#import "MenuTableViewCell.h"
#import "ConfigViewController.h"
#import "MainViewController.h"


@interface LeftViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *menuArray;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (weak, nonatomic) IBOutlet UIButton *configBtn;

@end

@implementation LeftViewController

- (NSArray *)menuArray{
    if (!_menuArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Menu *menu = [Menu menuWithDict:dict];
            [tmpArray addObject:menu];
        }
        _menuArray = tmpArray;
    }
    return _menuArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuTableView.delegate = self;
    self.menuTableView.backgroundColor = [UIColor clearColor];
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    
}


#pragma mark - UITableView代理和数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reusedIdentifier = @"menu_cell";
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedIdentifier];
    if(!cell){
        cell = [[MenuTableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedIdentifier];
    }
    
    //设置"全部课程"默认高亮状态
    Menu *menuItem = self.menuArray[indexPath.row];
    cell.menuItem = menuItem;
    
    return cell;
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    MenuTableViewCell *cell = (MenuTableViewCell *)[self.menuTableView cellForRowAtIndexPath:indexPath];
    
        cell.selected = YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消"全部课程"默认高亮状态
    MenuTableViewCell *defaultCell = (MenuTableViewCell *)[self.menuTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    defaultCell.selected = NO;
    
    //设置“设置按钮” 未选中
    self.configBtn.selected = NO;
    
    self.currentIndexPath = indexPath;
    
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
    
    if (indexPath.row == 0) {
        if ([self.delegate respondsToSelector:@selector(pushControllerToCenterPanel:withTargetController:)]) {
            [self.delegate pushControllerToCenterPanel:self withTargetController:[MainViewController class]];
        }
    }
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];

    cell.selected = NO;
    
}



- (IBAction)configClick:(UIButton *)sender {
    
    sender.selected = YES;
    
    //取消menuTableView的所有选中状态
    NSIndexPath *indexPath = [self.menuTableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.menuTableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    if (sender.isSelected) {
        if ([self.delegate respondsToSelector:@selector(pushControllerToCenterPanel:withTargetController:)]) {
            [self.delegate pushControllerToCenterPanel:self withTargetController:[ConfigViewController class]];
        }
    
    }
    
}
@end
