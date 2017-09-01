//
//  HGLDataSouce.h
//  HGL_Objc_Example
//
//  Created by heiguoliangle on 2017/9/1.
//  Copyright © 2017年 heiguoliangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGLDataSourceModel.h"
#import "HGLDataSourceCell.h"


typedef void(^setCellModel)(HGLDataSourceCell * cell,HGLDataSourceModel * model);

@interface HGLDataSouce : NSObject<UITableViewDataSource>

@property(nonatomic,strong)NSArray * dataArr;

-(instancetype)initWithDataArr:(NSArray *)arr cellIdentifier:(NSString *)cellIdentifier finishBlock:(setCellModel)cellModelBlock;

-(id)modelWithIndexPath:(NSIndexPath *)indexPath;

@end
