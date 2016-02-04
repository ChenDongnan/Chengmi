//
//  FindViewController.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableView.h"
#import "HotDistrictCollectionView.h"

@interface FindViewController () {
    UISearchBar *_searchBar;  //搜索栏
    UIScrollView *_ScrollView;
    UIButton *_leftButton;
    UIButton *_rightButton;
    UIView *line;
    UIView *line1;
    
    FindTableView *_findTableview;
    HotDistrictCollectionView *_hotCollectionView;
    

}

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _creatSearchBar];
    
    [self _creatScrollView];
    [self _createHotDistrictView];

    [self creatTableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //修改NavigaionBar的高度
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, kScreenWidth, 80);
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    //[super viewWillAppear:animated];
    
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, kScreenWidth, 80);
}

//创建搜索栏
- (void)_creatSearchBar{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    self.navigationController.navigationBar.translucent = NO;
    
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    
    searchView.backgroundColor =self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10.0f, 0.0f, kScreenWidth-20, 44.0f)];
    _searchBar.delegate = self;
    
    
    [[[[ _searchBar.subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
    
    [ _searchBar setBackgroundColor :[ UIColor clearColor ]];
    
    
    
    [_searchBar setTintColor:[UIColor blackColor]];
    [_searchBar setPlaceholder:@"搜索地点、标题、标签"];
    
    [searchView addSubview:_searchBar];
    //self.navigationItem.titleView = searchView;
    [self.navigationController.navigationBar addSubview:searchView];
    
}
- (void)_creatScrollView{
    
    _ScrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _ScrollView.showsHorizontalScrollIndicator = NO;
    _ScrollView.showsVerticalScrollIndicator = NO;
    _ScrollView.backgroundColor = [UIColor whiteColor];
    _ScrollView.pagingEnabled = YES;
    _ScrollView.bounces = NO;
    _ScrollView.contentSize = CGSizeMake(2*kScreenWidth, 0);    //子视图超出父视图不裁剪
    
    _ScrollView.delegate = self;
    [self.view addSubview:_ScrollView];
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, 0, 100, 25);
    _leftButton.center = CGPointMake(kScreenWidth/4, 54);
    [_leftButton setTitle:@"热门地区" forState:UIControlStateNormal];
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_leftButton addTarget:self action:@selector(lefButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 2)];
    line.backgroundColor = [UIColor whiteColor];
    line.hidden = NO;
    line.center = CGPointMake(kScreenWidth/4, 71);
    
    [self.navigationController.navigationBar addSubview:_leftButton];
    [self.navigationController.navigationBar addSubview:line];
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 100, 25);
    _rightButton.center = CGPointMake(kScreenWidth*3/4, 54);
    [_rightButton setTitle:@"特色标签" forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_rightButton addTarget:self action:@selector(rightButtonActioh) forControlEvents:UIControlEventTouchUpInside];
    
    line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 2)];
    line1.backgroundColor = [UIColor whiteColor];
    line1.center = CGPointMake(kScreenWidth*3/4, 71);
    line1.hidden = YES;
    
    [self.navigationController.navigationBar addSubview:_rightButton];
    [self.navigationController.navigationBar addSubview:line1];
    
    
}

- (void)creatTableView{
    
    _findTableview = [[FindTableView alloc]initWithFrame:CGRectMake(kScreenWidth,36, kScreenWidth, kScreenHeight-36-80) style:UITableViewStyleGrouped];
    _findTableview.backgroundColor = [UIColor clearColor];
    _findTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [_ScrollView addSubview:_findTableview];
    
}





- (void)_createHotDistrictView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(120, 120);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    HotDistrictCollectionView * hotDCV = [[HotDistrictCollectionView alloc] initWithFrame:CGRectMake(0, 35,kScreenWidth, kScreenHeight -135) collectionViewLayout:layout];
    hotDCV.backgroundColor = [UIColor whiteColor];
    [_ScrollView addSubview:hotDCV];
    
}

- (void)lefButtonAction{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        line.hidden = NO;
        line1.hidden = YES;
        
        _ScrollView.contentOffset = CGPointMake(0, 0);
        
    }];
    
    
    
}
- (void)rightButtonActioh{
    
    [UIView animateWithDuration:0.5 animations:^{
        line1.hidden = NO;
        line.hidden = YES;
        _ScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    }];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x <= kScreenWidth/2) {
        
        line.hidden = NO;
        line1.hidden = YES;
    }else if(kScreenWidth/2<scrollView.contentOffset.x <=kScreenWidth)
    {
        line1.hidden = NO;
        line.hidden = YES;
        
    }
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
