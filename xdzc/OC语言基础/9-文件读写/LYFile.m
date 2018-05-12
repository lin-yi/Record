//
//  LYFile.m
//  xdzc
//
//  Created by 林一 on 09/05/2018.
//  Copyright © 2018 现代众车在线. All rights reserved.
//

#import "LYFile.h"

@implementation LYFile
{
    NSFileManager *manager;
    
}


-(NSString *)documentsPath{
    NSString *homeDirectory = NSHomeDirectory();
    
    //  /Users/linyi/Library/Developer/CoreSimulator/Devices/6AB2BD7F-A55E-4901-A3B9-5777B9BE4EAE/data/Containers/Data/Application/5C5A2E4F-0A64-4800-8A2A-703E41C2ADBE"
    [self pathArray];
    return homeDirectory;
}


-(NSArray *)pathArray{
    NSArray * documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSArray * libraryDirectory = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
/*
 
 FOUNDATION_EXPORT NSArray<NSString *> *NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde);

 
directory
NSSearchPathDirectory类型的enum值，表明我们要搜索的目录名称，比如这里用NSDocumentDirectory表明我们要搜索的是Documents目录。
如果我们将其换成NSCachesDirectory就表示我们搜索的是Library/Caches目录。
 
domainMask
NSSearchPathDomainMask类型的enum值，指定搜索范围，这里的NSUserDomainMask表示搜索的范围限制于当前应用的沙盒目录。
还可以写成NSLocalDomainMask（表示/Library）、NSNetworkDomainMask（表示/Network）等。
 
expandTilde
BOOL值，表示是否展开波浪线。我们知道在iOS中的全写形式是/User/userName，该值为YES即表示写成全写形式，为NO就表示直接写成“~”。

 */
    
//    NSString * documentDirectory = [paths lastObject];
//
//  /Users/linyi/Library/Developer/CoreSimulator/Devices/6AB2BD7F-A55E-4901-A3B9-5777B9BE4EAE/data/Containers/Data/Application/5C5A2E4F-0A64-4800-8A2A-703E41C2ADBE/Documents
//    NSLog(@"%@", documentPath);
    return libraryDirectory;
   
}

@end
