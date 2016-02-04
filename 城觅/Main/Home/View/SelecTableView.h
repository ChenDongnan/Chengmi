//
//  SelecTableView.h
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectionModel;
typedef void (^leftBlock)(CGFloat y);
@interface SelecTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,assign)CGFloat leftScrollY;
@property(nonatomic,copy)leftBlock block;
@property(nonatomic,strong)SelectionModel *leftModel;




@end
