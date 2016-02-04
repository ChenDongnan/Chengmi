//
//  CommDetailViewController.m
//  城觅
//
//  Created by Allen on 15/12/31.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "CommDetailViewController.h"
#import "CommTableView.h"
#import "Common.h"
@interface CommDetailViewController ()
{
    CommTableView *_tableView;
   
}
@end

@implementation CommDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden =YES;
    
}

- (void)creatTopView {
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 44)];
    
    topView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    label.text = @"推荐";
    label.center = CGPointMake(kScreenWidth/2, 22);
    label.textColor = [UIColor whiteColor];
    [topView addSubview:label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40, 40)];
    [button setImage:[UIImage imageNamed:@"select_btn_back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];
    button.center = CGPointMake(kScreenWidth/8, 22);
    [topView addSubview:button];
    
    [self.view addSubview:topView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
//    [UIView animateWithDuration:1 animations:^{
//        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
//        imgView.image = [UIImage imageNamed:@"recommend_kj_4@2x"];
//    }];
       self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[CommTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // self.navigationController.navigationBar.backgroundColor =[UIColor whiteColor];
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"index-navigationBg@2x"] forBarMetrics:UIBarMetricsDefault];
    
    [self creatTopView];
    
    [self.view addSubview:_tableView];
    _tableView.commMosel = self.commModel;
    UIImageView *_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    _imgView.image = [UIImage imageNamed:@"recommend_kj_4@2x"];
    [self.view addSubview:_imgView];
    
 
    [self performSelector:@selector(hidImageView:) withObject:_imgView afterDelay:0.5];
}
- (void)hidImageView:(UIImageView*)imgView {
    
    imgView.hidden = YES;
    
}

- (void)closeAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
