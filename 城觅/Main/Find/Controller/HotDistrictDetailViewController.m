//
//  HotDistrictDetailViewController.m
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "HotDistrictDetailViewController.h"
#import "DetailTableView.h"
#import "AFNetworking.h"
#import "DetailTableViewModel.h"
#import "DetailHeaderView.h"
#import "UIViewExt.h"
#import "RecommendTableView.h"
#import "DetailRmdViewController.h"
#import "RmdTableViewModel.h"
#import "UIView+UIViewController.h"
#import "DetailRmdTableView.h"

@interface HotDistrictDetailViewController ()
{
    DetailTableView *_tableView;
    RecommendTableView *_rmdTableView;
    DetailRmdTableView *_detailRmdTableView;
    
}

@end

@implementation HotDistrictDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
    [self _createRmdTableView];
    [self _createScrollView];
    [self _createHeaderView];
    [self _createSecondHeaderView];
    [self _createBackButton];
    [self _createShareButton];
    

}
- (void)_createShareButton {
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(kScreenWidth- 80, 10, 80, 40) ;
    [shareButton setImage:[UIImage imageNamed:@"btn_share_normal"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];

}

- (void)shareButtonAction {
    
}
- (void)_createRmdTableView {
     _rmdTableView = [[RecommendTableView alloc] initWithFrame:CGRectMake(kScreenWidth, -20, kScreenWidth, kScreenHeight + 27) style:UITableViewStylePlain];
    _rmdTableView.delegate = self;
}
- (void)_createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _scrollView.tag = 103;
    _scrollView.contentSize = CGSizeMake(kScreenWidth*2, 0);
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
   
    
    [_scrollView addSubview:_tableView];
    [_scrollView addSubview:_rmdTableView];
    [self.view addSubview:_scrollView];
}
- (void)_createBackButton {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 10, 100, 50) ;
    [backButton setImage:[UIImage imageNamed:@"NavBackWhite"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

- (void)backButtonAction {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)_createTableView {
    _tableView = [[DetailTableView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight+27) style:UITableViewStylePlain];
    
    //_tableView.contentSize = CGSizeMake(0, 4000);
    _tableView.delegate = self;
  // _headerView.top = _tableView.contentOffset.x ;
    //[self.view addSubview:_tableView];
}

- (void)_createHeaderView {
    
    _headerView = [[[NSBundle mainBundle]loadNibNamed:@"DetailHeaderView" owner:self options:nil]lastObject];
    _headerView.frame = CGRectMake(0, 0, kScreenWidth, 220);
    [_headerView.choicenessButton addTarget:self action:@selector(choicenessButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
     [_headerView.recommendButton addTarget:self action:@selector(recommendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    if (_scrollView.contentOffset.x > kScreenWidth/2) {
        [_headerView.recommendButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_headerView.choicenessButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _headerView.leftLineView.hidden = YES;
        _headerView.rightLineView.hidden = NO;
        _headerView.rightLineView.backgroundColor = [UIColor orangeColor];
        
    }
    if (_scrollView.contentOffset.x <  kScreenWidth/2) {
        [_headerView.recommendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_headerView.choicenessButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _headerView.leftLineView.hidden = NO;
        _headerView.leftLineView.backgroundColor = [UIColor orangeColor];
        
        _headerView.rightLineView.hidden = YES;
    }
    

    [self.view addSubview:_headerView];
}

- (void)_createSecondHeaderView {
    self.secondHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"DetailHeaderViewSecond" owner:self options:nil]lastObject];
    
    self.secondHeaderView.hidden = YES;
    self.secondHeaderView.backgroundColor = [UIColor orangeColor];
    [_secondHeaderView.choicenessButton addTarget:self action:@selector(choicenessButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_secondHeaderView.recommendButton addTarget:self action:@selector(recommendButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_secondHeaderView];
}

- (void)choicenessButtonAction {
    [_headerView.choicenessButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_headerView.recommendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _headerView.leftLineView.hidden = NO;
    _headerView.rightLineView.hidden = YES;
            _headerView.leftLineView.backgroundColor = [UIColor orangeColor];
    [UIView animateWithDuration:0.3 animations:^{
      _scrollView.contentOffset = CGPointMake(0, 0);
    }];
}

- (void)recommendButtonAction {
    [_headerView.recommendButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [_headerView.choicenessButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.3 animations:^{
    _scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    }];
    
    _headerView.rightLineView.hidden = NO;
    _headerView.rightLineView.backgroundColor = [UIColor orangeColor];
    _headerView.leftLineView.hidden = YES;
    _secondHeaderView.rightLineView.hidden = NO;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _secondHeaderView.leftLineView.hidden = _headerView.leftLineView.hidden;
    _secondHeaderView.rightLineView.hidden = _headerView.rightLineView.hidden;
    

    if (scrollView.tag == 101) {
        _headerView.top = -_tableView.contentOffset.y;
        if (scrollView.contentOffset.y >= 120) {
            _headerView.hidden =YES;
            _secondHeaderView.hidden = NO;
        }
        if (scrollView.contentOffset.y <= 120) {
            _headerView.hidden = NO;
            _secondHeaderView.hidden = YES;
        }

    }
    if (scrollView.tag == 102) {
        _headerView.top = -_rmdTableView.contentOffset.y;
        if (scrollView.contentOffset.y >= 120) {
            _headerView.hidden =YES;
            _secondHeaderView.hidden = NO;
        }
        if (scrollView.contentOffset.y <= 120) {
            _headerView.hidden = NO;
            _secondHeaderView.hidden = YES;
        }

    }
   // if (scrollView.tag == 103) {
        
    if (_scrollView.contentOffset.x > kScreenWidth/2) {
        [_headerView.recommendButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_headerView.choicenessButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
         _headerView.leftLineView.hidden = YES;
        _secondHeaderView.leftLineView.hidden = YES;
         _headerView.rightLineView.hidden = NO;
        _headerView.rightLineView.hidden = NO;
        _headerView.rightLineView.backgroundColor = [UIColor orangeColor];
        
    }
    if (_scrollView.contentOffset.x <  kScreenWidth/2) {
        [_headerView.recommendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_headerView.choicenessButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _headerView.leftLineView.hidden = NO;
        _secondHeaderView.leftLineView.hidden = NO;
        _headerView.leftLineView.backgroundColor = [UIColor orangeColor];
        _headerView.rightLineView.hidden = YES;
        _headerView.rightLineView.hidden = YES;
    }
        
   // }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 101) {
        return 240;
    }
    else if (tableView.tag == 102)
    {
        if (indexPath.row == 0) {
            return 240;
        }
        else{
            return 340;
        }
    }
    return 0;
    
}
- (void)requestData:(NSInteger) i {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlString = @"http://apiv29.chengmi.com/v29/section/list";
    NSArray *parameterArray = @[@{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwMiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"5ba65df5bcc9c37bb7aee33d01443cd9"},
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwMywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"6edd96d623ff033cf955f6e34f3e2d10"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwNCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"77fb5a1345abaf739aba79150e19305e"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwNSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"62ed8e4745f0b6b023398cd5ab0076d6"
                                    },
                                @{	@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwNiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id":@"200002",
                                    @"verify": @"b0e3685df30151e9a1cdb0cf59f6b645"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwNywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"c856a3ecb00eefa00a90c7354170b2a7"
                                    },
                                @{	@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwOCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                
                                @"app_id": @"200002",
                                @"verify": @"ff33cce433051ae2fd73f09d0c7a24f7"
                                },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUwOSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"4c0cbaccb7d94dfbe1a718c4d45ba59a"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxMCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"264898e12756a51e3c0f9d440f789bc3"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxMSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"b2868f7acb6e4d3efdeb32ea8e38ac6b"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxMiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"9cbb82e64aae283f28d1c85adbfc41f0"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxMywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"91d51b02bf6df835c31144ba9ee6d79a"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxNCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"184055ba1cdb64ffb284d6eea4bb4999"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxNSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"93995557244e9c8725fbf2710c13c4ec"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxNiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id":@"200002",
                                    @"verify": @"6dbebcfaafc7392a15c2ebf204962b3f"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxNywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"476fee771cb40ccbe30b162177da56c5"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjUxOCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                                    @"app_id": @"200002",
                                    @"verify": @"26cb44e4db932d3747adb069692f6abf"
                                    }

                                
];
    


    manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager POST:urlString parameters:parameterArray[i] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            NSDictionary *dict = responseObject[@"body"];
            NSArray *tagArray = dict[@"tag_info_list"];
            for (NSDictionary *tagDict in tagArray) {
            DetailTableViewModel *model = [[DetailTableViewModel alloc] initWithDataDic:tagDict];
            _headerView.model = model;
            _secondHeaderView.model = model;
            }
            

            NSArray *sectionArray = dict[@"section_list"];
            NSMutableArray *modelArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in sectionArray) {
                DetailTableViewModel *model = [[DetailTableViewModel alloc] initWithDataDic:dic];
                [modelArray addObject:model];
            }
            _tableView.dataArray = modelArray;
            [_tableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
}

- (void)requestRmdData:(NSInteger) i {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     NSString *urlString = @"http://apiv29.chengmi.com/v29/article/list";
    NSArray *parameterArray = @[@{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTAyIiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"177a62a4f2a27e07635fd61bdf0b5066"},
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTAzIiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"20f2ed8170adc44a6060b2e22976ebc6"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA0IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"938520da082a690e3b7f6599fc73a929"
                                    },
                                @{
                                       @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA1IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                        @"app_id": @"200002",
                                       @"verify": @"1fc3eadb7acb1978431e9a0e87f6330d"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA2IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"97f4bfef1acb2699ad766127595cc950"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA3IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"1b55b56ef3dcdb65f029ba0dd93e875c"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA4IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"f60455dae09f3ed05ed84feb600a7437"
                                },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA5IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"53c19b279707595283b548d72dfcefc7"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTA4IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"0bab71c081949eeb18d185e1a080e783"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTExIiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"6a99856273b2010ced775aec55b1fb5a"
                                }
,
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTEyIiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"35b9dc57db1d6d8e54f32106d4f95772"
                                    }
,
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTEzIiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"2635cc59a5a5b7c83489067a795218e6"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTE0IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"3bb97c7638f7a38265460689e14ec9e2"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTE1IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"e6b410904e27e468c8bc20ffbf1016ff"
                                    },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTE2IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"840f8d2ae4c1ee0179eab39930ca615e"
                                },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTE4IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"27049cec8c809412831b5af7dd66ed8f"
                                },
                                @{
                                    @"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgInRhZ19pZCIgOiAiNTE3IiwKICAiY2F0X3R5cGUiIDogInRhZyIsCiAgInBlcnBhZ2UiIDogMjAKfQ==",
                                    @"app_id": @"200002",
                                    @"verify": @"384e9faf6894cc136e59f35c2574ce62"
                                }
                                ];
    
    
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:urlString parameters:parameterArray[i] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dict = responseObject[@"body"];
        
        NSArray *articleArray = dict[@"article_list"];
        NSMutableArray *modelArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in articleArray) {
            
             RmdTableViewModel *model = [[RmdTableViewModel alloc] initWithDataDic:dic];
            
            [modelArray addObject:model];
        }
        _rmdTableView.dataArray = modelArray;
        _detailRmdTableView.dataArray = modelArray;
        [_rmdTableView reloadData];
        [_detailRmdTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailRmdViewController *rmdVC = [[DetailRmdViewController alloc]init];
    
    if (tableView.tag == 102) {
        [self showViewController:rmdVC sender:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
