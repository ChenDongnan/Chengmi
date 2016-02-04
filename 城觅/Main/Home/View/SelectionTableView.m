//
//  SelectionTableView.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "SelectionTableView.h"
#import "SelectionTableViewCell.h"
#import "SelectDetailController.h"
@implementation SelectionTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"SelectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"selectioncell"];
        
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 360;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SelectionTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"selectioncell" forIndexPath:indexPath];
    
    cell.selectionModel = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = (UIViewController *)tableView.nextResponder.nextResponder.nextResponder;
    SelectDetailController *selectVC = [[SelectDetailController alloc]init];
    selectVC.selectionModel = _dataArray[indexPath.row];
    // UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:selectVC];
    selectVC.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
    [vc presentViewController:selectVC animated:YES completion:nil];
}
@end
