//
//  CommunityTableView.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "CommunityTableView.h"
#import "CommunityTableViewCell.h"
#import "Common.h"
#import "CommDetailViewController.h"
@implementation CommunityTableView
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIView *_HeaderView;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"CommunityTableViewCell" bundle:nil] forCellReuseIdentifier:@"communitycell"];
        [self createHeaderView];
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray {
    
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        
        for (int i =0; i<5; i++) {
            UIImageView *imgView = [_HeaderView viewWithTag:200+i];
            NSDictionary *dic = self.flash[i];
            
            [imgView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"pic"]]];
        }
        
        self.tableHeaderView = _HeaderView;
    }
}


- (void)createHeaderView {
    
    _HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3)];
    

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3)];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(kScreenWidth*5, kScreenHeight/3);
    _scrollView.delegate = self;
    _scrollView.clipsToBounds = NO;
    
   
    for (int i = 0; i < 5; i++) {
        UIImageView *_imgView =[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight/3)];
        _imgView.tag = 200+i;
       
        [_scrollView addSubview:_imgView];
        
    }
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _scrollView.bottom-20, kScreenWidth, 20)];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    _pageControl.autoresizingMask = UIViewAutoresizingNone;
    
    [_HeaderView addSubview:_scrollView];
    [_HeaderView addSubview:_pageControl];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = scrollView.contentOffset.x/kScreenWidth;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 400;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"communitycell" forIndexPath:indexPath];
    cell.communityModel = _dataArray[indexPath.row];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = (UIViewController *)tableView.nextResponder.nextResponder.nextResponder;
    CommDetailViewController *commVC = [[CommDetailViewController alloc]init];
    commVC.commModel = _dataArray[indexPath.row];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:commVC];
   
    commVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [vc presentViewController:nav animated:YES completion:nil];
    
}


@end
