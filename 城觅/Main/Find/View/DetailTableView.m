//
//  DetailTableView.m
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "DetailTableView.h"
#import "DetailTableViewModel.h"
#import "DetailTableViewCell.h"
#import "UIView+UIViewController.h"
static NSString *tableReuseID = @"tableCell";
@implementation DetailTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tag = 101;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UINib *nib = [UINib nibWithNibName:@"DetailTableViewCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:tableReuseID];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_share_normal"]];
        self.viewController.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
        
    }
    return  self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count +1 ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableReuseID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell = [[DetailTableViewCell alloc ]init];
        return cell;
    }else{
    
    cell.model = self.dataArray[indexPath.row-1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ArticleViewController *articleVC = [[ArticleViewController alloc] init];
//    [self.viewController showViewController:articleVC sender:nil];
}



@end
