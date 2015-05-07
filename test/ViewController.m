//
//  ViewController.m
//  test
//
//  Created by 车雨欣 on 15/4/26.
//  Copyright (c) 2015年 cyx. All rights reserved.
//
#define CORNER_RADIUS 5
#define PANEL_OFFSET 240

#import "ViewController.h"
#import "RightViewController.h"
#import "MainViewController.h"
#import "NaviController.h"
#import "LeftViewController.h"
#import "ConfigViewController.h"

@interface ViewController ()  <UIGestureRecognizerDelegate, MainViewControllerDelegate, RightViewControllerDelegate, LeftViewControllerDelegate,ConfigViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (weak, nonatomic) IBOutlet UIView *navContainer;
@property (weak, nonatomic) IBOutlet UIView *leftContainer;

@property (nonatomic, weak) MainViewController *mainVc;
@property (nonatomic, weak) RightViewController *rightVc;
@property (nonatomic, weak) NaviController *navVc;
@property (nonatomic, weak) LeftViewController *leftVc;
@property (nonatomic, weak) NaviController  *configNavVc;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, assign) CGPoint startCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.panGesture addTarget:self action:@selector(moveNavView:)];
    self.panGesture.delegate = self;
    
    self.navVc =  self.childViewControllers[1];
    self.leftVc = self.childViewControllers[0];
    self.mainVc = self.navVc.childViewControllers[0];
    self.mainVc.delegate = self;
    self.leftVc.delegate = self;


}

//视图的视觉效果
- (void)showView:(UIView *)view WithShadow:(BOOL)value withOffset:(double)offset
{
    
    if (value) {
        view.layer.shadowOffset = CGSizeMake(offset, offset);
        view.layer.cornerRadius = CORNER_RADIUS;
        view.layer.shadowOpacity = 0.8;
        view.layer.shadowRadius = CORNER_RADIUS;
    }else{
        view.layer.shadowRadius = 0.0f;
        view.layer.shadowOffset = CGSizeMake(offset, offset);
        view.layer.shadowRadius = 0;
        view.layer.cornerRadius = 0;
    }
}

- (void)moveCenterPanel{
    
    CGRect frameN = self.navContainer.frame;
    CGRect frameL = self.leftContainer.frame;
    

    if (self.navContainer.frame.origin.x == 0) {
        
        frameN.origin.x = PANEL_OFFSET;
        frameL.origin.x = PANEL_OFFSET * 0.1;
    }else{
        frameN.origin.x = 0;
        frameL.origin.x = -PANEL_OFFSET * 0.1;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.navContainer.frame = frameN;
        self.leftContainer.frame = frameL;
    }];

}


#pragma mark - ConfigViewControllerDelegate

- (void)moveCenterPanelFromConfig:(ConfigViewController *)configVc{
    [self moveCenterPanel];
}

#pragma mark - MainViewControllerDelegate

- (void)moveCenterPanelFromMain:(MainViewController *)mainVc{
    [self moveCenterPanel];
}

- (void)moveRightViewControllerToCenter:(MainViewController *)mainVc{

    //懒加载一个右控制器
    
    //1 将右控制器添加为子控制器
    [self addChildViewController:self.rightVc];
    
    CGRect oldFrame = self.view.frame;
    oldFrame.origin.x = self.view.frame.size.width;
   
    //2 设置控制器view的frame
    self.rightVc.view.frame = oldFrame;
    
    //3 设置控制器view为当前控制器容器的子view，动画
    [self.navContainer addSubview:self.rightVc.view];
    [UIView animateWithDuration:0.5 animations:^{
        self.rightVc.view.frame = self.view.frame;
    }];
    
    //4 调用子控制其的以下方法标识操作完成
    [self.rightVc didMoveToParentViewController:self];
    
}
#pragma mark - LeftViewControllerDelegate
- (void)pushControllerToCenterPanel:(LeftViewController *)leftViewController withTargetController:(Class)targetVc{
    [self removeAllSubviews];

    if (targetVc == [ConfigViewController class]) {
        
        [self addChildViewController:self.configNavVc];
        [self.navContainer addSubview:self.configNavVc.view];
        
        
        [self moveCenterPanel];
    }else if(targetVc == [MainViewController class]){
        
        [self addChildViewController:self.navVc];
        [self.navContainer addSubview:self.navVc.view];
        
        
        [self moveCenterPanel];
    }
    
}


#pragma mark - RightViewControllerDelegate

- (void)removeRightViewController:(RightViewController *)rightVc{
    
    //确定即将要移动到的终点位置
    CGRect newFrame = self.rightVc.view.frame;
    newFrame.origin.x = self.rightVc.view.frame.size.width;
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.rightVc.view.frame = newFrame;
    } completion:^(BOOL finished) {
        
        //移除子控制器和相关视图(固定三步)
        [self.rightVc willMoveToParentViewController:nil];
        [self.rightVc.view removeFromSuperview];
        [self.rightVc removeFromParentViewController];

    }];
    
}

#pragma mark - 手势识别功能
- (void)moveNavView:(UIPanGestureRecognizer *)panGesture{
    
    //开始拖动
    if(panGesture.state == UIGestureRecognizerStateBegan){
        
        self.startPoint = [panGesture locationInView:self.view];
        self.startCenter = self.navContainer.center;
        
        //正在拖动
    }else if(panGesture.state == UIGestureRecognizerStateChanged){
        
        self.currentPoint = [panGesture locationInView:self.view];
        
        if((self.startPoint.x - self.currentPoint.x) < 0 || self.navContainer.frame.origin.x > 0){
            
            CGFloat offsetX = self.startCenter.x + self.currentPoint.x - self.startPoint.x;
            self.navContainer.center = CGPointMake(offsetX, [UIScreen mainScreen].bounds.size.height * 0.5);
            self.leftContainer.center = CGPointMake(offsetX * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
        }
        
        
        //如果拖动时，视图没有在圆角位置，则显示阴影和圆角
        if (self.navContainer.frame.origin.x > 0) {
            
            [self showView:self.mainVc.view WithShadow:YES withOffset:0.25];
        }
        
    }else if(panGesture.state == UIGestureRecognizerStateEnded){
        
        
        if (self.navContainer.frame.origin.x < ([UIScreen mainScreen].bounds.size.width / 3)) {
            //如果拖动不到三分之一
            [UIView animateWithDuration:0.1 animations:^{
                
                self.navContainer.frame = [UIScreen mainScreen].bounds;
            }];
            
            
        }else{
            
            //拖动超过三分之一
            CGRect frameN  = self.navContainer.frame;
            CGRect frameL = self.leftContainer.frame;
            
            frameN.origin.x = PANEL_OFFSET;
            frameL.origin.x = PANEL_OFFSET * 0.1;
            
            [UIView animateWithDuration:0.1 animations:^{
                
                self.navContainer.frame = frameN;
                self.leftContainer.frame = frameL;
            }];
        }
        
        //如果停止时视图在原点位置，则取消所有的阴影、圆角效果
        if (self.navContainer.frame.origin.x == 0) {
            
            [self showView:self.mainVc.view WithShadow:NO withOffset:0.25];
        }
    }
    
}

/**
 *  功能：在添加新的控制器到控制器容器中，首先清掉容易中所有的子视图
 */
- (void)removeAllSubviews{
    for (UIView *subview in self.navContainer.subviews) {
        [subview removeFromSuperview];
    }
}

#pragma mark - 懒加载控制器

- (RightViewController *)rightVc{
    if (!_rightVc) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"RightView" bundle:nil];
        RightViewController *rightVc = [sb instantiateViewControllerWithIdentifier:@"rightView"];
        _rightVc = rightVc;
        
        _rightVc.delegate = self;
    }
    return _rightVc;
}

- (NaviController *)configNavVc{
    if (!_configNavVc) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Config" bundle:nil];
        _configNavVc = [sb instantiateViewControllerWithIdentifier:@"NavConfig"];
        
        ConfigViewController *configVc = (ConfigViewController *)_configNavVc.topViewController;
        configVc.delegate = self;


    }
    return _configNavVc;
}

@end
