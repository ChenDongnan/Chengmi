//
//  CommDetailCell.m
//  城觅
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "CommDetailCell.h"
#import "Common.h"
@implementation CommDetailCell
{
    UILabel *label;
    UIImageView *imagView;
}
- (void)awakeFromNib {
    
   
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, kScreenWidth-40, 150)];
        //label.backgroundColor = [UIColor redColor];
        label.numberOfLines = 0 ;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor grayColor];
        [self addSubview:label];
    
        imagView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 340)];
        //imagView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:imagView];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellDic:(NSDictionary *)cellDic {
    
    if (_cellDic != cellDic) {
        _cellDic = cellDic;
        
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSString *imgName =[_cellDic objectForKey:@"pic"];
    
    if (imgName == nil) {
        imagView.hidden = YES;
        label.hidden = NO;
        label.text = [_cellDic objectForKey:@"ch"];
        label.height = [CommDetailCell getHeight:[_cellDic objectForKey:@"ch"]];
           }else {

        imagView.hidden = NO;
        label.hidden = YES;
        [imagView sd_setImageWithURL:[NSURL URLWithString:imgName]];

    }

  }

+ (CGFloat)getHeight:(NSString *)str {
    
//    NSAttributedString *string = [[NSAttributedString alloc]initWithString:str];
//    NSRange range = NSMakeRange(0, string.length);
//    NSDictionary *dic = [string attributesAtIndex:0 effectiveRange:&range];
    
    CGRect x = [str boundingRectWithSize:CGSizeMake(kScreenWidth-40, 1000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{
                                                                                                                                    NSFontAttributeName:[UIFont systemFontOfSize:16]
                                                                                                                                    }context:nil];
    
    return x.size.height;
    
}
@end
