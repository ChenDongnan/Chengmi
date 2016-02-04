//
//  RecommendTableView.m
//  城觅
//
//  Created by huiwen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "RecommendTableView.h"
#import "RecommendTableViewCell.h"
#import "UIViewExt.h"
#import "UIView+UIViewController.h"
#import "DetailRmdViewController.h"
static NSString *tableReuseID = @"RmdTableCell";
@implementation RecommendTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tag = 102;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UINib *nib = [UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:tableReuseID];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count+1 ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableReuseID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell = [[RecommendTableViewCell alloc ]init];
        return cell;
    }else{
        
        cell.model = self.dataArray[indexPath.row-1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}





@end
