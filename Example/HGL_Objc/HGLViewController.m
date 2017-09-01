//
//  HGLViewController.m
//  HGL_Objc
//
//  Created by heiguoliangle on 09/01/2017.
//  Copyright (c) 2017 heiguoliangle. All rights reserved.
//

#import "HGLViewController.h"
#import "HGLDataSouce.h"

@interface HGLViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView * tableView;
@property(nonatomic,strong)HGLDataSouce * dataSouce;
@end

@implementation HGLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUINav];
    [self setupTableView];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)setupUINav {
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"reload" style:UIBarButtonItemStyleDone target:self action:@selector(reloadView)];
//    self.navigationController.navigationItem.rightBarButtonItem = item;
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)reloadView {
    
    NSMutableArray * mutArr  = [NSMutableArray array];
    for (int i = 9; i < 99; i ++) {
        HGLDataSourceModel * model = [[HGLDataSourceModel alloc]init];
        model.title = [NSString stringWithFormat:@"%d",i];
        [mutArr addObject:model];
    }
    self.dataSouce.dataArr = mutArr.copy;
    [self.tableView reloadData];
}

#pragma mark - setTableView
- (void)setupTableView {
    
    
    setCellModel modelBlock = ^(HGLDataSourceCell * cell,HGLDataSourceModel * model){
        [cell setCellDataWith:model];
    };
    
    HGLDataSourceModel * model1 = [[HGLDataSourceModel alloc]init];
    model1.title = @"1";
    HGLDataSourceModel * model2 = [[HGLDataSourceModel alloc]init];
    model2.title = @"2";
    NSArray * cellArr = @[model1,model2];
    
    static NSString * key = @"cellIdentifier";
    HGLDataSouce * dataSouce = [[HGLDataSouce alloc]initWithDataArr:cellArr cellIdentifier:key finishBlock:modelBlock];
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = dataSouce;
    tableView.delegate = self;
    self.dataSouce = dataSouce;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}


#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
