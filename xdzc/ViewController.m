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
#import "MyClass.h"
#import "UIView+gesture.h"
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
    
//    TestMetaClass(self, nil);
    
//    [self ex_registerClassPair];
    
    
//    [self operationClass];
    
//    [self creatClass];
    
//    [self classCreateInstance];
    
//    [self myGetClassList];
    
//    float a[] = {1.0, 2.0, 3.0, 4.0, 5.0};
//    NSLog(@"array encoding type: %s", @encode(typeof(a)));
//
//
//    double b[] = {1.0, 2.0, 3.0, 4.0, 5.0};
//    NSLog(@"array encoding type: %s", @encode(typeof(b)));

//     如果是我写的话，我应该怎么去实现？
//    [self.view setTapActionWithBlock:^{
//        NSLog(@"这么牛逼💯");
//    }];

    
    NSMutableDictionary *map = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    [map setObject:@"zhangsan1" forKey:@"name1"];
    [map setObject:@"zhangsan2" forKey:@"name2"];
    [map setObject:@"begin" forKey:@"stetus1"];
    [map setObject:@"end" forKey:@"stetus2"];
    NSLog(@"map = %@",map);
    
    
    map[@"name1"]                = @"name";
    map[@"name2"]                = @"name";
    
    map[@"stetus1"]              = @"status";
    map[@"stetus2"]              = @"status";
    
    NSLog(@"map = %@",map);
    
    // 2018年04月08日09:11:06
    
}

//- (void)setTapActionWithBlock:(void (^)(void))block
//{
//    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
//
//    if (!gesture)
//    {
//        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
//        [self.view addGestureRecognizer:gesture];
//        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
//    }
//    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
//}

-(void)myGetClassList{
//    int numClasses;
//    Class * classes = NULL;
//    numClasses = objc_getClassList(NULL, 0);
//    if (numClasses > 0) {
////        classes = alloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        NSLog(@"number of classes: %d", numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            Class cls = classes[i];
//            NSLog(@"class name: %s", class_getName(cls));
//        }
//        free(classes);
//    }
}

-(void)operationClass{
    MyClass *myClass = [[MyClass alloc] init];
    unsigned int outCount = 0;
    Class cls = myClass.class;
    NSLog(@"outCount = %d",outCount);
    // 类名
    NSLog(@"class name: %s", class_getName(cls));
    NSLog(@"==========================================================");
    NSLog(@"outCount = %d",outCount);
    // 父类
    NSLog(@"super class name: %s", class_getName(class_getSuperclass(cls)));
    NSLog(@"==========================================================");
    // 是否是元类
    NSLog(@"MyClass is %@ a meta-class", (class_isMetaClass(cls) ? @"" : @"not"));
    NSLog(@"==========================================================");
    Class meta_class = objc_getMetaClass(class_getName(cls));
    NSLog(@"%s's meta-class is %s", class_getName(cls), class_getName(meta_class));
    NSLog(@"==========================================================");
    NSLog(@"outCount = %d",outCount);
    // 变量实例大小
    NSLog(@"instance size: %zu", class_getInstanceSize(cls));
    NSLog(@"==========================================================");
    // 成员变量
    NSLog(@"outCount = %d",outCount);
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    NSLog(@"outCount = %d",outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s at index: %d", ivar_getName(ivar), i);
    }
    free(ivars);
    Ivar string = class_getInstanceVariable(cls, "_string");
    if (string != NULL) {
        NSLog(@"instace variable %s", ivar_getName(string));
    }
    NSLog(@"==========================================================");
    // 属性操作
    objc_property_t * properties = class_copyPropertyList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSLog(@"property's name: %s", property_getName(property));
    }
    free(properties);
    objc_property_t array = class_getProperty(cls, "array");
    if (array != NULL) {
        NSLog(@"property %s", property_getName(array));
    }
    NSLog(@"==========================================================");
    // 方法操作
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        NSLog(@"method's signature: %s", method_getName(method));
    }
    free(methods);
    Method method1 = class_getInstanceMethod(cls, @selector(method1));
    if (method1 != NULL) {
        NSLog(@"method %s", method_getName(method1));
    }
    Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
    if (classMethod != NULL) {
        NSLog(@"class method : %s", method_getName(classMethod));
    }
    NSLog(@"MyClass is%@ responsd to selector: method3WithArg1:arg2:", class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
    IMP imp = class_getMethodImplementation(cls, @selector(method1));
    imp();
    NSLog(@"==========================================================");
    // 协议
    Protocol * __unsafe_unretained * protocols = class_copyProtocolList(cls, &outCount);
    Protocol * protocol;
    for (int i = 0; i < outCount; i++) {
        protocol = protocols[i];
        NSLog(@"protocol name: %s", protocol_getName(protocol));
    }
    NSLog(@"MyClass is%@ responsed to protocol %s", class_conformsToProtocol(cls, protocol) ? @"" : @" not", protocol_getName(protocol));
    NSLog(@"==========================================================");
}



void imp_submethod1(id self, SEL _cmd)
{
    NSLog(@"C 语言的，有何用？");
}



-(void)creatClass{
    Class cls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);
    class_addMethod(cls, @selector(submethod1), (IMP)imp_submethod1, "v@:");
    class_replaceMethod(cls, @selector(method1), (IMP)imp_submethod1, "v@:");
//    class_addIvar(cls, "_ivar1", sizeof(NSString *), log(sizeof(NSString *)), "i");
//    objc_property_attribute_t type = {"T", "@\"NSString\""};
//    objc_property_attribute_t ownership = { "C", "" };
//    objc_property_attribute_t backingivar = { "V", "_ivar1"};
//    objc_property_attribute_t attrs[] = {type, ownership, backingivar};
//    class_addProperty(cls, "property2", attrs, 3);
    objc_registerClassPair(cls);
    id instance = [[cls alloc] init];
    [instance performSelector:@selector(submethod1)];
    [instance performSelector:@selector(method1)];
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


-(void)classCreateInstance{
    id theObject = class_createInstance(NSString.class, sizeof(unsigned));
    
    id str1 = [theObject init];
    NSLog(@"%@", [str1 class]);
    id str2 = [[NSString alloc] initWithString:@"test"];
    NSLog(@"%@", [str2 class]);
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
