//
//  SelectDetailController.m
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "SelectDetailController.h"
#import "Common.h"
#import "SelecTableView.h"
#import "DetailTopView.h"
#import "HomeDetailHeaderView.h"
#import "SelectOtherTableView.h"
#import "SelectionModel.h"
@implementation SelectDetailController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollX = 0;
    //self.navigationController.navigationBar.hidden = YES;
    
    _topView = [[DetailTopView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 44)];
    [_topView.leftButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_topView];
    
    _headerView = [[HomeDetailHeaderView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 260)];
    [_headerView createSelectButton:2 withButtonNames:@[@"推荐",@"信息"]];
    _headerView.delegate = self;
    [self.view insertSubview:_headerView belowSubview:_topView];
    
    [self creatScrollView];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [_headerView.imageView sd_setImageWithURL:[NSURL URLWithString:self.selectionModel.pic_list[0]]];
    _topView.textLabel.text = self.selectionModel.title;
    
    _leftTableView.leftModel = self.selectionModel;
    [_leftTableView reloadData];
    
    _rightTableView.rightModel = self.selectionModel;
    [_rightTableView reloadData];
    
}
- (void)creatScrollView {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(kScreenWidth*2, kScreenHeight-20);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view insertSubview:_scrollView belowSubview:_headerView];
    
    _leftTableView = [[SelecTableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight-20) style:UITableViewStylePlain];
    _rightTableView = [[SelectOtherTableView alloc]initWithFrame:CGRectMake(kScreenWidth, 20, kScreenWidth, kScreenHeight-20) style:UITableViewStylePlain];
    
    
    __weak HomeDetailHeaderView *weakHeaderView = _headerView;
//    __weak SelecTableView *weakLeftTableView = _leftTableView;
    __weak SelectDetailController *weakSelf = self;
    
    _leftTableView.block = ^(CGFloat y){
        if (y<160) {
              weakHeaderView.top = 20 - y;
             weakSelf.scrollY = y;
            NSLog(@"y====%f",y);
        }else if (y>=160){
            weakHeaderView.top = 20 - 160;
            weakSelf.scrollY = 160;
        }
        CGFloat alpha = 0.0;
        alpha = (y-120)/40.0;
        NSLog(@"%f",alpha);
        weakHeaderView.filmView.alpha = alpha;
    };
    
    _rightTableView.block = ^(CGFloat y){
        if (y<160) {
            weakHeaderView.top = 20 - y;
            weakSelf.scrollY = y;
            NSLog(@"%f",y);
        }else if (y>=160){
            weakHeaderView.top = 20 - 160;
            weakSelf.scrollY = 160;
        }
        CGFloat alpha = 0.0;
        alpha = (y-120)/40.0;
        NSLog(@"%f",alpha);
        weakHeaderView.filmView.alpha = alpha;
    };
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_rightTableView];
}


#pragma mark - DetailHeaderView delegate
- (void)selectToView:(NSInteger)viewTag {
    
    NSInteger i = viewTag-100;
    _scrollView.contentOffset = CGPointMake(i*kScreenWidth, 0);
    switch (i) {
        case 0:
            _leftTableView.contentOffset = CGPointMake(0, _scrollY);
            break;
        case 1:
            _rightTableView.contentOffset = CGPointMake(0, _scrollY);
            break;
        default:
            break;
    }

}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   // NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat Myoffset = offsetX - _scrollX;
    _scrollX = offsetX;
    NSInteger index = offsetX/kScreenWidth;
    
    if (Myoffset>0 && offsetX/kScreenWidth >= (0.5+index)) {
        
        [_headerView flagViewto:index +1];
        
    }else if(Myoffset<0 && offsetX/kScreenWidth <= (0.5+index)){
        
        [_headerView flagViewto:index];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/kScreenWidth;
    NSLog(@"%li",index);
    switch (index) {
        case 0:
            _leftTableView.contentOffset = CGPointMake(0, _scrollY);
            break;
        case 1:
            _rightTableView.contentOffset = CGPointMake(0, _scrollY);
            break;
        default:
            break;
    }
    
    
}

#pragma mark - UIButton action
- (void)closeAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    
////    SelecTableView *_tableView = [[SelecTableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight-20) style:UITableViewStylePlain];
////    [self.view insertSubview:_tableView belowSubview:_topView];
//    
//    
//}


@end
