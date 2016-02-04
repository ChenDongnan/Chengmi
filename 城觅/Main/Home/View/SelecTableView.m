//
//  SelecTableView.m
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "SelecTableView.h"
#import "SelectCell.h"
#import "Common.h"
#import "SelectionModel.h"
@implementation SelecTableView
{
    UIImageView *_headerView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        [self registerClass:[SelectCell class] forCellReuseIdentifier:@"cell"];
        self.dataSource = self;
        self.delegate = self;
        [self createHeaderView];
        self.bounces = NO;
        self.separatorStyle =UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}


- (void)createHeaderView {
    
    _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 260)];
    _headerView.backgroundColor = [UIColor grayColor];
    
    self.tableHeaderView = _headerView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = (NSDictionary *)self.leftModel.communityModel.newcontent[indexPath.row];
    NSString *imgName =[dic objectForKey:@"pic"];
    if (imgName == nil) {
        CGFloat height = [CommDetailCell getHeight:[dic objectForKey:@"ch"]]+10;
        return height;
    }
    return 360;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.leftModel.communityModel.newcontent.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    
//    return 60;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.cellDic = self.leftModel.communityModel.newcontent[indexPath.row];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 50)];
//    label.text = @"aaaaaaaaaaaaaaa";
//    cell.backgroundColor = [UIColor grayColor];
//    [cell addSubview:label];
//
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
//    view.backgroundColor = [UIColor orangeColor];
//    return view;
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //NSLog(@"%f",scrollView.contentOffset.y);
//    UIScrollView *scroll = (UIScrollView*)scrollView.superview;
//    scroll.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    self.leftScrollY = scrollView.contentOffset.y;
   
    //self.contentInset = UIEdgeInsetsMake(_leftScrollY, 0, 0, 0);
    if (self.block != nil) {
        self.block(scrollView.contentOffset.y);
    }
}

@end
