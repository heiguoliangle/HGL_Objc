//
//  HGLDataSourceCell.m
//  HGL_Objc_Example
//
//  Created by heiguoliangle on 2017/9/1.
//  Copyright © 2017年 heiguoliangle. All rights reserved.
//

#import "HGLDataSourceCell.h"
#import "HGLDataSourceModel.h"

@interface HGLDataSourceCell()

@property(nonatomic,weak)UILabel * label;
@end

@implementation HGLDataSourceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI {
    UILabel * label = [[UILabel alloc]init];
    label.frame = self.bounds;
    [self.contentView addSubview:label];
    
    self.label = label;
}

-(void)setCellDataWith:(HGLDataSourceModel *)model{
    
    self.label.text = model.title;
    NSLog(@"%@",model);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
