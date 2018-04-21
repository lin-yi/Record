//
//  LYCatViewController.m
//  xdzc
//
//  Created by 林一 on 2018/3/27.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "LYCatViewController.h"
#import <AYCategory/AYCategory.h>
@interface LYCatViewController ()
@property(nonatomic,copy)NSString *name;
@end

@implementation LYCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hah");
    
    NSString *base64Encoding = @"what-the-hell";

    [base64Encoding ay_base64EncodedString];
    weak(self);
    weak_self.name = @"a";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"what");
    
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
