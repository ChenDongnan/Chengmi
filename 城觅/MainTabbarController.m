//
//  MainTabbarController.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "MainTabbarController.h"
#import "Common/Common.h"
@interface MainTabbarController ()
{
    UIButton *_selectButton;
}
@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubviewController];
    [self _createTabBar];
}

- (void)_createSubviewController {
    
    NSArray *storyID = @[@"Home",@"Find",@"Message",@"Profile"];
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i = 0; i < storyID.count; i++) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyID[i] bundle:nil];
        UINavigationController *navController = [storyboard instantiateInitialViewController];
        [navArray addObject:navController];
    }
    self.viewControllers = navArray;
}

- (void)_createTabBar {
    
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
        }
    }
    
    NSArray *tabBarItem = @[@"tabBar_indexNew",@"tabBar_discoverNew",@"tabBar_EXPNew",@"tabBar_mineNew"];
    NSArray *selectImage = @[@"tabBar_index2New",@"tabBar_discover2New",@"tabBar_EXP2New",@"tabBar_mine2New"];
    CGFloat width = kScreenWidth/4;
    for (int i=0 ; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width*i, 0, width, 49);
        
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:tabBarItem[i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selectImage[i]] forState:UIControlStateSelected];
        button.tag = i + 10;
        [self.tabBar addSubview:button];
    }
    
    self.tabBar.backgroundColor = [UIColor blackColor];
    _selectButton = [self.tabBar viewWithTag:10];
    _selectButton.selected = YES;
    
}

#pragma mark - tabbarAction 

- (void)selectAction:(UIButton *)button {
    self.selectedIndex = button.tag - 10;
    if (button == _selectButton) {
        
    }else {
        button.selected = !button.selected;
        _selectButton.selected = !_selectButton.selected;
        _selectButton = button;
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
