//
//  HomePageViewController.m
//  FYF
//
//  Created by 徐书传 on 16/4/13.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "HomePageViewController.h"
#import "BaseTableView.h"
#import "HomePageMidCell.h"
#import "HomePageBottomCell.h"
#import "DCPicScrollView.h"
#import "DCWebImageManager.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark -----UI------

-(void)configView
{
    [self configNavigaitonView];
    [self configTableView];
}

-(void)configTableView
{
    self.tableView = [[BaseTableView alloc] initWithFrame:RECT(0, 0,SCREENWIDTH, SCREENHEIGHT - NAVBAR_DEFAULT_HEIGHT - TABBAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = KColorGray1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSArray *UrlStringArray = @[@"http://e.hiphotos.baidu.com/lvpics/h=800/sign=61e9995c972397ddc97995046983b216/35a85edf8db1cb134d859ca8db54564e93584b98.jpg", @"http://e.hiphotos.baidu.com/lvpics/h=800/sign=1d1cc1876a81800a71e5840e813533d6/5366d0160924ab185b6fd93f33fae6cd7b890bb8.jpg", @"http://f.hiphotos.baidu.com/lvpics/h=800/sign=8430a8305cee3d6d3dc68acb73176d41/9213b07eca806538d9da1f8492dda144ad348271.jpg", @"http://d.hiphotos.baidu.com/lvpics/w=1000/sign=81bf893e12dfa9ecfd2e521752e0f603/242dd42a2834349b705785a7caea15ce36d3bebb.jpg", @"http://f.hiphotos.baidu.com/lvpics/w=1000/sign=4d69c022ea24b899de3c7d385e361c95/f31fbe096b63f6240e31d3218444ebf81a4ca3a0.jpg"];
    
    DCPicScrollView  *picView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140) WithImageUrls:UrlStringArray];
    
    
    picView.placeImage = [UIImage imageNamed:@"timeline_image_loading.png"];
    
    [picView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("第%zd张图片\n",index);
    }];
    
    picView.AutoScrollDelay = 2.0f;
    
    
    //下载失败重复下载次数,默认不重复,
    [[DCWebImageManager shareManager] setDownloadImageRepeatCount:3];
    
    //图片下载失败会调用该block(如果设置了重复下载次数,则会在重复下载完后,假如还没下载成功,就会调用该block)
    [[DCWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
        
    }];
    
    
    self.tableView.tableHeaderView = picView;
    
    [self.view addSubview:self.tableView];


}

-(void)configNavigaitonView
{
    [self addNavigationLeftBtnWithImage:nil HightImage:nil Target:self action:@selector(toMessageAction:)];
}

#pragma -mark -----UITableView Delegate Methods-----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [self getLineViewWithFrame:RECT(0, 0, SCREENWIDTH, 10)];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [HomePageMidCell getCellHeight];
    }
    else
    {
        return [HomePageBottomCell getCellHeight];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HomePageMidCell *cell = [[HomePageMidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        return cell;
    }
    else
    {
        HomePageBottomCell *cell = [[HomePageBottomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        return cell;
    }
}

#pragma -mark -----Aciton------

-(void)toMessageAction:(id)sender
{
    
}

@end
