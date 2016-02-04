//
//  DetailTopView.m
//  城觅
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailTopView.h"
#import "Common.h"
@implementation DetailTopView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}




- (void)createView {
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth*3/4 -40 , 40)];
//    _textLabel.text = @"推荐";
    _textLabel.textAlignment = NSTextAlignmentLeft;
    _textLabel.font = [UIFont systemFontOfSize:17];
    _textLabel.center = CGPointMake(kScreenWidth/2, 22);
    _textLabel.textColor = [UIColor whiteColor];
    [self addSubview:_textLabel];
    
    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40, 44)];
    [_leftButton setImage:[UIImage imageNamed:@"select_btn_back"] forState:UIControlStateNormal];    
    _leftButton.center = CGPointMake(kScreenWidth/8, 22);
    [self addSubview:_leftButton];

    
    _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    [_rightButton setImage:[UIImage imageNamed:@"select_btn_back"] forState:UIControlStateNormal];
    _rightButton.center = CGPointMake(kScreenWidth*7/8, 22);
    [self addSubview:_rightButton];
    
}
@end
