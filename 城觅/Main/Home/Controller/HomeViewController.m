//
//  HomeViewController.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "HomeViewController.h"
#import "Common.h"
#import "TopView.h"
#import "NearbyTableView.h"
#import "SelectionTableView.h"
#import "CommunityTableView.h"
#import "SelectionModel.h"
#import "NearbyModel.h"
#import "CommunityModel.h"
@interface HomeViewController ()
{
    UIScrollView *_scrollView;
    TopView *_topView;
    NSMutableArray *_dataArray;
    SelectionTableView *_select;
    NearbyTableView *_nearby;
    CommunityTableView *_community;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    
    [self _createScrollView];
    [self requestSelectionData];
    [self requestNearbyData];
    [self requestCommunityData];
    
    
}

- (void)_createTopView {
    _topView =[[[NSBundle mainBundle]loadNibNamed:@"TopView" owner:self options:nil]lastObject];
    
    _topView.frame = CGRectMake(0, 20, kScreenWidth, 44);
    _topView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    _topView.scrollView = _scrollView;
        
    [self.view addSubview:_topView];
    
}
- (void)_createScrollView {
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-49)];
    [self _createTopView];

    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.contentSize = CGSizeMake(kScreenWidth*3, kScreenHeight-64);
    _scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    _community = [[CommunityTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-114) style:UITableViewStylePlain];
    _community.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    
    _select = [[SelectionTableView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight-114) style:UITableViewStylePlain];
    _select.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _nearby = [[NearbyTableView alloc]initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, kScreenHeight-114)style:UITableViewStylePlain];
    _nearby.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_scrollView addSubview:_community];
    [_scrollView addSubview:_select];
    [_scrollView addSubview:_nearby];
    

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
   // NSLog(@"%f",scrollView.contentOffset.x);
    NSInteger x = (scrollView.contentOffset.x+10)/kScreenWidth;
     UIButton *button = [_topView viewWithTag:100+x];
    
    if (x == 0) {
        [_topView communityButton:button];
    }if (x == 1) {
        [_topView selectionButton:button];
    }if (x == 2) {
        [_topView nearbyButton:button];
    }

}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
      NSLog(@"%f",scrollView.contentOffset.x);
}

- (void)requestSelectionData {
    
    NSString *url = @"http://apiv29.chengmi.com/v29/index/main";
    NSDictionary *parames = @{@"params":@"ewogICJjaXR5X2lkIiA6IDExLAogICJwZXJwYWdlIiA6IDIwLAogICJjdXJwYWdlIiA6IDEKfQ==",@"app_id":@"200002",@"verify":@"667ced203baa36c33071cd87027c44fa"};
    
    [self requestPostDataWithURL:url parames:parames completionHandle:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [responseObject objectForKey:@"body"];
                NSArray *array = [dic objectForKey:@"pinterest"];
                NSMutableArray *modelArray = [NSMutableArray array];
                for (NSDictionary *dic in array) {
                    NSDictionary *goodsDic = dic[@"goods"];
                    SelectionModel *model = [[SelectionModel alloc]initWithDataDic:goodsDic];
                    [modelArray addObject:model];
                }
                _select.dataArray = modelArray;
                [_select reloadData];

    }];
}

- (void)requestNearbyData {
    
    NSString *url = @"http://apiv29.chengmi.com/v29/section/list";
    NSDictionary *parames = @{@"params":@"ewogICJ0YWdfaWQiIDogIjAiLAogICJjdXJsbmciIDogIjEyMC4xMzkzMjYiLAogICJjYXRfdHlwZSIgOiAibmVhcmJ5IiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImN1cnBhZ2UiIDogMSwKICAiY2l0eV9pZCIgOiAxMSwKICAicGVycGFnZSIgOiAyMCwKICAiY3VybGF0IiA6ICIzMC4xODY0MzciLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9Igp9",@"app_id":@"200002",@"verify":@"1ad0ca37dc0b0da43a19903631f6226a"};
    [self requestPostDataWithURL:url parames:parames completionHandle:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [responseObject objectForKey:@"body"];
                NSArray *array = [dic objectForKey:@"section_list"];
                NSMutableArray *modelArray = [NSMutableArray array];
                for (NSDictionary *dic in array) {
                    NearbyModel *model = [[NearbyModel alloc]initWithDataDic:dic];
                    [modelArray addObject:model];
                }
                _nearby.dataArray = modelArray;
                [_nearby reloadData];

    }];
}

- (void)requestCommunityData {
    
    NSString *url = @"http://apiv29.chengmi.com/v29/index/forum";
    NSDictionary *parames = @{@"params":@"ewogICJjaXR5X2lkIiA6IDExLAogICJjdXJwYWdlIiA6IDEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iCn0=",@"app_id":@"200002",@"verify":@"fcbb911ba53acdbfcf61f66f4e124a13"};
   
    
    [self requestPostDataWithURL:url parames:parames completionHandle:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [responseObject objectForKey:@"body"];
                NSArray *array = [dic objectForKey:@"article_list"];
                _community.flash = [dic objectForKey:@"flash"];
                NSMutableArray *modelArray = [NSMutableArray array];
                for (NSDictionary *dic in array) {
                    CommunityModel *model = [[CommunityModel alloc]initWithDataDic:dic];
                    [modelArray addObject:model];
                }
                _community.dataArray = modelArray;
                [_community reloadData];
    }];
}

- (void)requestPostDataWithURL:(NSString *)url parames:(NSDictionary *)parames completionHandle:(PostBlock)block {
    
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
     manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
     [manager POST:url parameters:parames success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         block(task,responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         block(task,error);
     }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
