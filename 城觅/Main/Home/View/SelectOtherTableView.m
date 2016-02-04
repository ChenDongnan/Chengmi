//
//  SelectOtherTableView.m
//  城觅
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "SelectOtherTableView.h"
#import "SelectOtherCell.h"
#import "Common.h"
@implementation SelectOtherTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
       
        self.dataSource = self;
        self.delegate = self;
        self.bounces = NO;
        [self createHeaderView];
        [self registerClass:[SelectOtherCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}


- (void)createHeaderView {
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 260)];
    _headerView.backgroundColor = [UIColor grayColor];
    
    self.tableHeaderView = _headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 50)];
    label.text = @"aaaaaaaaaaaaaaa";
    cell.backgroundColor = [UIColor blueColor];
    [cell addSubview:label];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.block != nil) {
        self.block(scrollView.contentOffset.y);
    }
    
}
@end
