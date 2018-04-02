//
//  ViewController.m
//  xdzc
//
//  Created by 现代众车 on 2018/1/6.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "ViewController.h"
#import "ProjectDetailsView.h"
#import "CardTableViewCell.h"
#import "Service.h"
#import "ActivityWebView.h"
#import <objc/runtime.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
    ProjectDetailsView *projectDetails;
    NSArray *sectionHeaderTitleArray;
    NSArray *parkingInformationTitles;
    NSArray *parkingInformationContents;
    NSArray *relevantDataTitles;
    NSArray *relevantDataContents;
    
    __weak IBOutlet UITextField *userName;
    
    __weak IBOutlet UITextField *password;
    
    __weak IBOutlet UITextView *resultView;
    
    Service *loginService;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initStringData];
//    [self initTableView];
    
    TestMetaClass(self, nil);
    
    [self ex_registerClassPair];
    
}


void TestMetaClass(id self, SEL _cmd) {
    NSLog(@"\n\nThis objcet is %p", self);
    NSLog(@"Class is %@, super class is %@", [self class], [self superclass]);
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p \n\n\n", objc_getClass((__bridge void *)[NSObject class]));
}

- (void)ex_registerClassPair {
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}



- (IBAction)loginAction:(UIButton *)sender {
    loginService = [Service new];
    [loginService loginByMobile:userName.text andPassword:password.text success:^(UserModel *userModel, id result) {
        NSString *resultText = [NSString stringWithFormat:@"filehost = %@  \ntoken = %@",
                           result[@"keyMain"][@"filehost"],
                           result[@"keyMain"][@"token"]];
        resultView.text = resultText;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (IBAction)goToWebView:(UIButton *)sender {
      [self.view endEditing:YES];
    ActivityWebView *webView = [ActivityWebView new];
    webView.userName = userName.text;
    webView.password = password.text;
    webView.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)initStringData{
    sectionHeaderTitleArray = [[NSArray alloc] initWithObjects:@"项目介绍",@"车位信息",@"相关资料",@"风控师意见",@"借款人资产", nil];
    
    
    parkingInformationTitles = [[NSArray alloc] initWithObjects:@"地址",@"开发商",@"小区",@"车位位置",@"车位面积",@"评估价格", nil];
    parkingInformationContents = [[NSArray alloc] initWithObjects:@"深圳福田",@"万科地产",@"xx小区",@"xx小区",@"xx小区",@"xx小区", nil];
    relevantDataTitles = [[NSArray alloc] initWithObjects:@"资料名称",@"身份证",@"银行卡",@"征信报告",@"资产证明",@"合同资料", nil];
    relevantDataContents = [[NSArray alloc] initWithObjects:@"44211*************3",@"6222*************21",@"xxxx",@"xxxx",@"xxxx",@"xxxx", nil];
}

-(void)initTableView{
    UITableView *myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                          style:UITableViewStyleGrouped];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1){
        return parkingInformationTitles.count;
    }else if(section == 2){
        return relevantDataTitles.count;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sectionHeaderTitleArray.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ProjectDetailsView *titleView = [ProjectDetailsView new];
    titleView.frame = CGRectMake(0, 0, tableView.frame.size.width, 0);
    titleView.headTitleLabel.text = sectionHeaderTitleArray[section];
    return  titleView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) {
        return 150;
    }
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"onlyContent";
    NSInteger index = 0;
    
    if(indexPath.section==0) {
        identifier = @"onlyContent";
        index = 0;
    }else if(indexPath.section==1){
        identifier = @"titleAndContent";
        index = 1;
    }else if(indexPath.section==2){
        identifier = @"titleAndContentInTable";
        index = 2;
    }
 
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell = [[NSBundle mainBundle] loadNibNamed:@"CardTableViewCell" owner:self options:nil] [index];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
