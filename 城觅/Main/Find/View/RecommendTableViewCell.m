//
//  RecommendTableViewCell.m
//  城觅
//
//  Created by huiwen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation RecommendTableViewCell

- (void)setModel:(RmdTableViewModel *)model {
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews {
    
    //用户名
    NSDictionary *authorDic = self.model.author_info;
    NSString *userName = authorDic[@"user_name"];
    _userName.text = userName;
    
    //用户头像
    _headerView.layer.cornerRadius = 20;
    _headerView.layer.masksToBounds = YES;
    NSString *headImgUrl = authorDic[@"avatar"];
    [_headerView sd_setImageWithURL:[NSURL URLWithString:headImgUrl]];
    //_headerView.layer.cornerRadius = 20;
    
    //图片
    NSArray *contentArray = self.model.newcontent;
    if (contentArray.count >=2) {
        if (contentArray[0][@"ch"] != nil) {
            _introduce.text = contentArray[0][@"ch"];
        }
        
        else if(contentArray[1][@"ch"]!= nil) {
            _introduce.text = contentArray[1][@"ch"];
        }
        
        if (contentArray[0][@"pic"] != nil) {
            NSString *imgUrl = contentArray[0][@"pic"];
            [_imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
        }
        else if (contentArray[1][@"pic"] != nil) {
            NSString *imgUrl = contentArray[1][@"pic"];
            [_imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
        }
    }
    

    
    //地点
    NSDictionary *poiDict = self.model.poi_info;
    _placeName.text = poiDict[@"poi_name"];
    
    //标签
    NSMutableArray *tagNameArray = [NSMutableArray array];
    NSArray *tagArray = self.model.tag_list;
    for (NSDictionary *dic in tagArray) {
        NSString *tagName = dic[@"tag_name"];
        [tagNameArray addObject:tagName];
    }
    NSInteger i;
    for (i = 1 ; i < tagNameArray.count; i++) {
        NSMutableString *str = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@·",tagNameArray[0]]];
        if (i == tagNameArray.count -1) {
            _tagName.text = [str stringByAppendingString:[NSString stringWithFormat:@"%@",tagNameArray[i]]];
        }
        else {
        _tagName.text = [str stringByAppendingString:[NSString stringWithFormat:@"%@·",tagNameArray[i]]];
        }
    }
    
    // _tagName.text = [NSString stringWithFormat:@"%@·%@·%@",tagNameArray[0],tagNameArray[1],tagNameArray[2]];
    
    
    
    //时间
    
    NSString *fullString =[NSString stringWithFormat:@"%@",[NSDate dateWithTimeIntervalSince1970:[self.model.created_at integerValue]]];
    NSString *createTime = [fullString substringWithRange:NSMakeRange(0, 10)];
    
    _createDate.text = createTime;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
