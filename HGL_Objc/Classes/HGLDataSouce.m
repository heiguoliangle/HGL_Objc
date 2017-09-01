//
//  HGLDataSouce.m
//  HGL_Objc_Example
//
//  Created by heiguoliangle on 2017/9/1.
//  Copyright © 2017年 heiguoliangle. All rights reserved.
//

#import "HGLDataSouce.h"

@interface HGLDataSouce()
@property(nonatomic,copy)setCellModel modelBlock;

@property(nonatomic,copy)NSString * cellIdentifier;


@end

@implementation HGLDataSouce
-(instancetype)initWithDataArr:(NSArray *)arr cellIdentifier:(NSString *)cellIdentifier finishBlock:(setCellModel)cellModelBlock{
    self = [super init];
    if (self) {
        _dataArr = arr;
        _cellIdentifier = cellIdentifier;
        _modelBlock = cellModelBlock;
    }
    return self;
    
}


-(id)modelWithIndexPath:(NSIndexPath *)indexPath{
    HGLDataSourceModel * model = self.dataArr[indexPath.row];
    return model;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * key = @"HGLDataSouce";
    
    HGLDataSourceCell * cell = [tableView dequeueReusableCellWithIdentifier:key];
    if (cell == nil) {
        cell = [[HGLDataSourceCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:key];
    }
    
    HGLDataSourceModel * model = _dataArr[indexPath.row];
    
    _modelBlock(cell,model);
    return cell;
    
}

@end
