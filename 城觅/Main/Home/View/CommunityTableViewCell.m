//
//  CommunityTableViewCell.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "CommunityTableViewCell.h"
#import "CommunityModel.h"
#import "Common.h"
@implementation CommunityTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCommunityModel:(CommunityModel *)communityModel {
    
    if (_communityModel != communityModel) {
        _communityModel = communityModel;
        
        [self setNeedsLayout];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _userNameLabel.text = self.communityModel.authorModel.user_name;
    
    [_uesrImg sd_setImageWithURL:[NSURL URLWithString:self.communityModel.authorModel.avatar]];
    _uesrImg.layer.masksToBounds = YES;
    _uesrImg.layer.cornerRadius = 25;
    
    NSString *timeStr = [NSString stringWithFormat:@"%@",[NSDate dateWithTimeIntervalSince1970:[self.communityModel.created_at integerValue]]];
    NSString *time = [timeStr substringWithRange:NSMakeRange(5, 11)];
    _creatTimeLabel.text = time;
    for (NSDictionary *dic in self.communityModel.newcontent) {
        if ([dic objectForKey:@"pic"]!= nil) {
            [_goodsImg sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"pic"]]];
            break;
        }
        
    }
    
    for (NSDictionary *dic in self.communityModel.newcontent) {
        if ([dic objectForKey:@"ch"]!= nil) {
            _titleLabel.text = [dic objectForKey:@"ch"];
            break;
        }
        
    }
    

    if (self.communityModel.poi_info != nil) {
        _poi_nameLabel.text = [self.communityModel.poi_info objectForKey:@"poi_name"];
    }
    
    if (self.communityModel.tag_list.count ==0 ) {
        _tag_nameLabel.hidden = YES;
        
    }else {
        _tag_nameLabel.hidden = NO;
        _tag_nameLabel.text = [self.communityModel.tag_list[0] objectForKey:@"tag_name"];
    };
   
    
    
    
}
@end
