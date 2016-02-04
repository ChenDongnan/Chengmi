//
//  CommTableView.m
//  城觅
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "CommTableView.h"
#import "CommDetailCell.h"
#import "Common.h"
#import "UIImageView+WebCache.h"
@implementation CommTableView
{
    UIView *_headerView;
    UIImageView *_userImg;
    UILabel *_nameLabel;
    UILabel *_timeLabel;
    
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[CommDetailCell class] forCellReuseIdentifier:@"cell"];
        [self createHeaderView];
    
    }
    return self;
}

- (void)setCommMosel:(CommunityModel *)commMosel {
    
    if (_commMosel != commMosel) {
        _commMosel = commMosel;
        
        self.tableHeaderView = _headerView;
        [_userImg sd_setImageWithURL:[NSURL URLWithString:self.commMosel.authorModel.avatar]];
        _nameLabel.text = self.commMosel.authorModel.user_name;
        NSString *timeStr = [NSString stringWithFormat:@"%@",[NSDate dateWithTimeIntervalSince1970:[self.commMosel.created_at integerValue]]];
        NSString *time = [timeStr substringWithRange:NSMakeRange(5, 11)];
        _timeLabel.text = time;
    }
}

- (void)createHeaderView {
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 70)];
    _headerView.backgroundColor = [UIColor whiteColor];
   
    _userImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 50, 50)];
    _userImg.layer.cornerRadius = 25;
    _userImg.layer.masksToBounds = YES;
    [_headerView addSubview:_userImg];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 250, 30)];
    [_headerView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 20)];
    _timeLabel.text = @"不久前";
    _timeLabel.font =[UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor grayColor];
    [_headerView addSubview:_timeLabel];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _commMosel.newcontent.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    NSDictionary *dic = (NSDictionary *)self.commMosel.newcontent[indexPath.row];
    NSString *imgName =[dic objectForKey:@"pic"];
    if (imgName == nil) {
        CGFloat height = [CommDetailCell getHeight:[dic objectForKey:@"ch"]]+10;
        return height;
    }
    return 360;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor greenColor];
    NSDictionary *dic = (NSDictionary *)self.commMosel.newcontent[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    NSString *imgName =[dic objectForKey:@"pic"];
//    if (imgName == nil) {
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
//        [cell addSubview:label];
//        label.backgroundColor = [UIColor redColor];
//        label.text = [dic objectForKey:@"ch"];
//        [cell addSubview:label];
//        return cell;
//    }else {
//        
//        UIImageView *imagView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
//        imagView.backgroundColor = [UIColor blueColor];
//        [imagView sd_setImageWithURL:[NSURL URLWithString:imgName]];
//        [cell addSubview:imagView];
//        
//    }
    cell.cellDic = dic;
    return cell;

    
}
@end
