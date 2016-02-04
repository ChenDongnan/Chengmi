//
//  DetailRmdTableViewCell.m
//  城觅
//
//  Created by huiwen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailRmdTableViewCell.h"
#import "WXLabel.h"
#import "UIImageView+WebCache.h"
@implementation DetailRmdTableViewCell

- (void)setModel:(RmdTableViewModel *)model {
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}


- (void)layoutSubviews {
    NSArray *newcontentArray = self.model.newcontent;
    for (int i = 0; i < newcontentArray.count; i++) {
        if ([newcontentArray[i] objectForKey:@"ch"]!= nil) {
            self.label.text = [newcontentArray[i] objectForKey:@"ch"];
        }
        if ([newcontentArray[i] objectForKey:@"pic"] != nil) {
            NSString *imageUrl = [newcontentArray[i] objectForKey:@"pic"];
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        }
    }

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
