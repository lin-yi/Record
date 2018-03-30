//
//  CardTableViewCell.m
//  xdzc
//
//  Created by 现代众车 on 2018/1/8.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "CardTableViewCell.h"

@implementation CardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x = 0.5;//这里间距为10，可以根据自己的情况调整
    frame.size.width -= 10 * frame.origin.x;
    frame.size.height -= 2 * frame.origin.x;
    [super setFrame:frame];
}

@end
