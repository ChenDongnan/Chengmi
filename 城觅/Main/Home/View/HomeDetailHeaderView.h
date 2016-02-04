//
//  DetailHeaderView.h
//  城觅
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomeDetailHeaderViewDelegate <NSObject>

- (void)selectToView:(NSInteger)viewTag;

@end
@interface HomeDetailHeaderView : UIView
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIView *flagView;
@property(nonatomic, strong)UIView *filmView;
@property(nonatomic, weak) id<HomeDetailHeaderViewDelegate> delegate;

- (void)createSelectButton:(NSInteger)buttonNum withButtonNames:(NSArray*)buttonName;
- (void)flagViewto:(NSInteger)ViewTag;
@end
