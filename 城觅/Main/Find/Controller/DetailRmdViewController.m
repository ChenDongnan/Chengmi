//
//  DetailRmdViewController.m
//  城觅
//
//  Created by huiwen on 16/1/10.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailRmdViewController.h"
#import "DetailRmdTableView.h"
@interface DetailRmdViewController ()

@end

@implementation DetailRmdViewController {
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
}
- (void) _createTableView {
    DetailRmdTableView *detailRmdTableView = [[DetailRmdTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:detailRmdTableView];
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
