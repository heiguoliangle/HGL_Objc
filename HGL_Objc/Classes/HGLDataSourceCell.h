//
//  HGLDataSourceCell.h
//  HGL_Objc_Example
//
//  Created by heiguoliangle on 2017/9/1.
//  Copyright © 2017年 heiguoliangle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HGLDataSourceModel;
@interface HGLDataSourceCell : UITableViewCell
-(void) setCellDataWith:(HGLDataSourceModel *)model;
@end
