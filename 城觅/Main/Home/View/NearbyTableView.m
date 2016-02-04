//
//  NearbyTableView.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "NearbyTableView.h"
#import "NearbyTableViewCell.h"
#import "Common.h"
@implementation NearbyTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"NearbyTableViewCell" bundle:nil] forCellReuseIdentifier:@"nearcell"];
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NearbyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nearcell" forIndexPath:indexPath];
    
    cell.nearModel = _dataArray[indexPath.row];
    return cell;
}

@end
