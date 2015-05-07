//
//  RightViewController.m
//  test
//
//  Created by 车雨欣 on 15/4/27.
//  Copyright (c) 2015年 cyx. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation RightViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.backgroundColor = [UIColor colorWithRed:0.694 green:0.094 blue:0.184 alpha:1.000];
    
    self.searchBar.backgroundImage = [UIImage imageNamed:@"bg_searchbar"];
    

}

- (IBAction)cancelClick {
    
    [self.view endEditing:YES];
    //调用代理，将本控制器移除
    if ([self.delegate respondsToSelector:@selector(removeRightViewController:)]) {
        [self.delegate removeRightViewController:self];
    }
    
}

- (void)dealloc{
    NSLog(@"rightviewController");
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"textDidChange");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
