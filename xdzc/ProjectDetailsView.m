//
//  ProjectDetailsView.m
//  xdzc
//
//  Created by 现代众车 on 2018/1/6.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "ProjectDetailsView.h"

@interface ProjectDetailsView()

@end

@implementation ProjectDetailsView

-(instancetype)init{
    if(self = [super init]){
        self = [[NSBundle mainBundle] loadNibNamed:@"ProjectDetailsView" owner:nil options:nil][0];
    }
    return self;
}


@end
