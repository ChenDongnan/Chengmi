//
//  DetailRmdTableView.m
//  城觅
//
//  Created by huiwen on 16/1/13.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailRmdTableView.h"
#import "DetailRmdTableViewCell.h"
static NSString *reuseID = @"RmdCellID";

@implementation DetailRmdTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UINib *nib = [UINib nibWithNibName:@"DetailRmdTableViewCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:reuseID];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailRmdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
