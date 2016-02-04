//
//  FindTableView.m
//  城觅
//
//  Created by 1 on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "FindTableView.h"
#import "Common.h"
#import "LabelCollectionView.h"

#import "NetworkService.h"

@implementation FindTableView{


    NSArray *_Headerlabelarray;
    NSArray *_HeadImagearray;
    
    LabelCollectionView *_collectionView;
    
    NSArray *_DataArray;
    
    NSArray *_labelEatArray;
    NSArray *_labelDrinkArray;
    NSArray *_labelPlayArray;
    NSArray *_labelHappyArray;
    
    //请求数据的参数
    NSArray *_paramsEatArray;
    NSArray *_paramsDrinkArray;
    NSArray *_paramsPlayArray;
    NSArray *_paramsHappyArray;
    
    NSArray *_paramsDataArray;


}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        [self creatData];
        
    }
    
    return self;
}

-(void)creatData{
    //cell头视图数据
    _Headerlabelarray = @[@"吃",@"喝",@"玩",@"乐"];
    _HeadImagearray = @[@"eat.png",@"drink.png",@"play.png",@"happy.png"];

    //cell 数据
    _labelEatArray = @[@"云南味道",@"川菜",@"特色火锅",@"最爱私房菜",@"粉面",@"榴莲控",@"私厨",@"寻找秃黄油",@"吃蟹好去处",@"日式拉面",@"邪恶美食"];
    _labelDrinkArray = @[@"美妙下午茶",@"炸鸡啤酒",@"饮料",@"先多手后保暖",@"咖啡店",@"懒人外卖",@"居酒屋",@"泡酒吧",@"鸡尾酒",@"露台",@"啤酒",@"好咖啡"];
    _labelPlayArray = @[@"周末必去活动",@"展览",@"戏剧",@"直播最美秋叶",@"做手工",@"泡温泉",@"先多手后保暖",@"密室逃脱",@"课程",@"香山",@"派对"];
    _labelHappyArray = @[@"展览",@"礼品店",@"先多手后保暖",@"逛市集",@"糖果店",@"食材店",@"时装",@"单车行",@"古着",@"花坊",@"私人定制",@"家居",@"茶具小店"];
    
    _DataArray = @[_labelEatArray,_labelDrinkArray,_labelPlayArray,_labelHappyArray];
    
    //网路请求数据
    
    _paramsEatArray = @[@{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEwMzQiLCJjdXJs\nYXQiOiIzMC4xODU1NDciLCJjdXJsbmciOiIxMjAuMTM4NjEzIiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEwMzQsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"3b423cac848ec0310045de699f78b7a0"},
                         @{@"app_id": @"200003",
                           @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjE5MCIsImN1cmxh\ndCI6IjMwLjE4NjE3NiIsImN1cmxuZyI6IjEyMC4xMzk5MTkiLCJzb3J0d2F5IjoidGltZSIsImdy\nb3VwX2lkIjoiMCIsImtleXdvcmQiOiIiLCJsb2NhbF9hcmVhaWQiOjAsImxvY2FsX3RhZ2lkIjow\nLCJsb2NhbF90YWdsYWJlbF9pZCI6MTkwLCJvdGhlcl91aWQiOjAsInBlcnBhZ2UiOjIwLCJjdXJw\nYWdlIjoxLCJjaXR5X2lkIjoxMX0=\n",
                            @"verify": @"3d7d36c7d693a8258a1cb5e343ed5a89"},
                        @{
                            @"app_id": @"200003",
                            @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjE2MCIsImN1cmxh\ndCI6IjMwLjE4NjE3NiIsImN1cmxuZyI6IjEyMC4xMzk5MTkiLCJzb3J0d2F5IjoidGltZSIsImdy\nb3VwX2lkIjoiMCIsImtleXdvcmQiOiIiLCJsb2NhbF9hcmVhaWQiOjAsImxvY2FsX3RhZ2lkIjow\nLCJsb2NhbF90YWdsYWJlbF9pZCI6MTYwLCJvdGhlcl91aWQiOjAsInBlcnBhZ2UiOjIwLCJjdXJw\nYWdlIjoxLCJjaXR5X2lkIjoxMX0=\n",
                           @"verify": @"dd002b0a4c561daa23cf1e6e57ffbf41"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjkzOCIsImN1cmxh\ndCI6IjMwLjE4NjE3NiIsImN1cmxuZyI6IjEyMC4xMzk5MTkiLCJzb3J0d2F5IjoidGltZSIsImdy\nb3VwX2lkIjoiMCIsImtleXdvcmQiOiIiLCJsb2NhbF9hcmVhaWQiOjAsImxvY2FsX3RhZ2lkIjow\nLCJsb2NhbF90YWdsYWJlbF9pZCI6OTM4LCJvdGhlcl91aWQiOjAsInBlcnBhZ2UiOjIwLCJjdXJw\nYWdlIjoxLCJjaXR5X2lkIjoxMX0=\n",
                          @"verify": @"92d1404c53e86161d526fb5fda755a6a"},
                        @{@"app_id":@"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjE5NyIsImN1cmxh\ndCI6IjMwLjE4NjE3NiIsImN1cmxuZyI6IjEyMC4xMzk5MTkiLCJzb3J0d2F5IjoidGltZSIsImdy\nb3VwX2lkIjoiMCIsImtleXdvcmQiOiIiLCJsb2NhbF9hcmVhaWQiOjAsImxvY2FsX3RhZ2lkIjow\nLCJsb2NhbF90YWdsYWJlbF9pZCI6MTk3LCJvdGhlcl91aWQiOjAsInBlcnBhZ2UiOjIwLCJjdXJw\nYWdlIjoxLCJjaXR5X2lkIjoxMX0=\n",
                          @"verify": @"c10f125e841b168ef89c4cab2ce66290"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEwNDQiLCJjdXJs\nYXQiOiIzMC4xODYxNzYiLCJjdXJsbmciOiIxMjAuMTM5OTE5Iiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEwNDQsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"14839ea399ad2fe14f7c4cbc2f3d0a78"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEyMDUiLCJjdXJs\nYXQiOiIzMC4xODYxNzYiLCJjdXJsbmciOiIxMjAuMTM5OTE5Iiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEyMDUsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"64020053e8666c5b6b6f0a85afbd9bb3"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEzMjYiLCJjdXJs\nYXQiOiIzMC4xODYxNzYiLCJjdXJsbmciOiIxMjAuMTM5OTE5Iiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEzMjYsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"c69cc13c8bdb5ef72e9083afcb019259"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEzMzEiLCJjdXJs\nYXQiOiIzMC4xODYxNzYiLCJjdXJsbmciOiIxMjAuMTM5OTE5Iiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEzMzEsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"8e956fe21e612a1b8b6d8642da90e016"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjEwMjEiLCJjdXJs\nYXQiOiIzMC4xODYxNzYiLCJjdXJsbmciOiIxMjAuMTM5OTE5Iiwic29ydHdheSI6InRpbWUiLCJn\ncm91cF9pZCI6IjAiLCJrZXl3b3JkIjoiIiwibG9jYWxfYXJlYWlkIjowLCJsb2NhbF90YWdpZCI6\nMCwibG9jYWxfdGFnbGFiZWxfaWQiOjEwMjEsIm90aGVyX3VpZCI6MCwicGVycGFnZSI6MjAsImN1\ncnBhZ2UiOjEsImNpdHlfaWQiOjExfQ==\n",
                          @"verify": @"6324fb04ac280e9b699e1bfa2f75492e"},
                        @{@"app_id": @"200003",
                          @"params": @"eyJhY2Nlc3NfdG9rZW4iOiIiLCJjYXRfdHlwZSI6InRhZyIsInRhZ19pZCI6IjkzNSIsImN1cmxh\ndCI6IjMwLjE4NjE3NiIsImN1cmxuZyI6IjEyMC4xMzk5MTkiLCJzb3J0d2F5IjoidGltZSIsImdy\nb3VwX2lkIjoiMCIsImtleXdvcmQiOiIiLCJsb2NhbF9hcmVhaWQiOjAsImxvY2FsX3RhZ2lkIjow\nLCJsb2NhbF90YWdsYWJlbF9pZCI6OTM1LCJvdGhlcl91aWQiOjAsInBlcnBhZ2UiOjIwLCJjdXJw\nYWdlIjoxLCJjaXR5X2lkIjoxMX0=\n",
                          @"verify": @"ae37a845f771f471a502059bb7323205"}];
    
  
    
    _paramsDrinkArray = @[@{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjkzNiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"211e3d7485d778ac92653aab1b6f705a"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNTIsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                            @"app_id": @"200002",
                            @"verify": @"6cdac54b86e47af020e76ec3d6106a76"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjIwOCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"478d30973d1da5e8d8114f0990196abf"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNTEsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                            @"app_id": @"200002",
                            @"verify": @"7d64a64ca2bab854ff556f5727ce1b60"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE0NywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"4346016078d19f770dbb517d826c8abc"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEyODYsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                            @"app_id": @"200002",
                            @"verify": @"15eff518af438906fd217e8284f9d3af"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjIxNSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"ccd79d87ecffd84897e3b2c1406ab5aa"
                            },
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjg5MSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"e0972f1b7db9b37db422cc6f39f1b73d"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE3OCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"14f9bda7d4792ebcf6ab6b691005ba79"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE3OSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"77ec070043e51d79243254849d20f210"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjk4MiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"1cb768fcca74cb4038a4a0e5fbd9b937"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjkwNCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"459e35581e42266f1cc3743af2554ebb"}];
    
    _paramsPlayArray = @[@{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjk5OSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"e44278fddda8acc81bbed3f01079f8b1"
                           },
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEwOSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"24e12255c923c7f54d4dbffb10263d33"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEwOCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"555976b431e03154d7a55a9dd2429273"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNDMsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                           @"app_id": @"200002",
                           @"verify": @"a36b5dc60f0246234ce54c94f76ab650"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjkyNCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"47357381f376093061e07bd6ba60d23d"},
                         @{@
                             "params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzMzUsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                           @"app_id": @"200002",
                           @"verify": @"0e6ededfeffebf57de29e53f7fb1683e"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNTEsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                           @"app_id": @"200002",
                           @"verify": @"7d64a64ca2bab854ff556f5727ce1b60"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjk2NiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"0e2b280df5e24fe5c283cd8b27785aa0"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjExMCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @"verify": @"767451ce89c0b002d74c68302c918116"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNDQsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                           @"app_id": @"200002",
                           @"verify": @"3bbd9f2f98fb2a5f7e2ce6f4a2bc818c"},
                         @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjIxMywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                           @"app_id": @"200002",
                           @
                           "verify": @"76093a3cf39d772756f28e77d5e72460"}];
    
    _paramsHappyArray = @[@{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEwOSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"24e12255c923c7f54d4dbffb10263d33"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE3MCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"e5ea1a75760b298cb535b8b3ca7da92d"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzNTEsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                            @"app_id": @"200002",
                            @"verify": @"7d64a64ca2bab854ff556f5727ce1b60"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjExMDAsMCIsCiAgImdyb3VwX2lkIiA6IC0xLAogICJhY2Nlc3NfdG9rZW4iIDogIlkyaGxibWR0YVY4eU1ERTFNVEl3T0Y4eU5qSXdNalk9IiwKICAicGVycGFnZSIgOiAyMAp9",
                            @"app_id": @"200002",
                            @"verify": @"73ad5297f5bec713d6d95b795edaf105"
                            },
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjk0MywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"b2a813ebfb8a1ecf8926cc1471718360"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE4NywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"f5bf4eb6b39a9085882eb2502be65235"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjIxNiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"2bec1fbde9f5e96b4b6564c1af1d4e4d"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjE4NiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"7db92a6bb87e2e1c63d5fdc2c8073330"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjExNiwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"6a8c80f27c5fe7c0122d1e334a138820"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEzMywwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"c14c340457137ce66c1556ab70e49b92"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEyNSwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"377d7c6138b1a1bca30708c434c82ca6"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEyMCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"43a3bab08971f64259c8caf6940fcaf2"},
                          @{@"params": @"ewogICJjdXJwYWdlIiA6IDEsCiAgImNhdF90eXBlIiA6ICJ0YWciLAogICJ0YWdfaWQiIDogIjEyOCwwIiwKICAiZ3JvdXBfaWQiIDogLTEsCiAgImFjY2Vzc190b2tlbiIgOiAiWTJobGJtZHRhVjh5TURFMU1USXdPRjh5TmpJd01qWT0iLAogICJwZXJwYWdlIiA6IDIwCn0=",
                            @"app_id": @"200002",
                            @"verify": @"3ce5373a2510a9c319853733c62f5579"}];
    
    _paramsDataArray = @[_paramsEatArray,_paramsDrinkArray,_paramsPlayArray,_paramsHappyArray];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UICollectionViewFlowLayout *layout=[[ UICollectionViewFlowLayout alloc ] init ];
    
    _collectionView = [[LabelCollectionView alloc]initWithFrame:CGRectMake(10, 5, kScreenWidth-20, 115) collectionViewLayout:layout];
    _collectionView.scrollEnabled = NO;
    _collectionView.array = _DataArray[indexPath.section];
    _collectionView.paramsArray = _paramsDataArray[indexPath.section];
    
  
     _collectionView.backgroundColor = [UIColor clearColor];
    
    
    [cell addSubview:_collectionView];
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.06];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    imageview.image = [UIImage imageNamed:_HeadImagearray[section]];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 20, 20)];
    label.text = _Headerlabelarray[section];
    label.textColor = [UIColor grayColor];

    [view addSubview:imageview];
    [view addSubview:label];
    return view;


}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 120;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0;
}

@end
