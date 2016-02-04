//
//  DetailHeaderView.m
//  城觅
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "HomeDetailHeaderView.h"
#import "Common.h"
@implementation HomeDetailHeaderView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)createView {
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height-50)];
    _imageView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_imageView];
    
    _filmView= [[UIView alloc]initWithFrame:_imageView.frame];
    _filmView.backgroundColor = kBgColor;
    _filmView.alpha = 0;
    [self addSubview:_filmView];
   
}

- (void)createSelectButton:(NSInteger)buttonNum withButtonNames:(NSArray*)buttonName {
    
    CGFloat width = kScreenWidth/buttonNum;
    for (int i=0; i<buttonNum; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width*i, self.frame.size.height-50, width, 50)];
        [button setTitle:buttonName[i] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:kBgColor forState:UIControlStateNormal];
        [self addSubview:button];
    }
    UIButton *fristButton = [self viewWithTag:100];
    _flagView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 3)];
    _flagView.center =fristButton.center;
    _flagView.bottom = fristButton.bottom-5;
    _flagView.backgroundColor = kBgColor;
    [self addSubview:_flagView];
    
}

- (void)buttonAction:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(selectToView:)]) {
        [self.delegate selectToView:button.tag];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        _flagView.center = button.center;
        _flagView.bottom = button.bottom-5;
    }];
    
}

- (void)flagViewto:(NSInteger)ViewTag {
    
    UIButton *button = [self viewWithTag:ViewTag+100];
    
    [UIView animateWithDuration:0.3 animations:^{
        _flagView.center = button.center;
        _flagView.bottom = button.bottom-5;
    }];
    
}
@end
