//
//  ProjectDetailsView.h
//  xdzc
//
//  Created by 现代众车 on 2018/1/6.
//  Copyright © 2018年 代码仓库. All rights reserved.
//
/*
 
 1、这里实际要考虑，我要封装的是单个卡片的视图，还是包括外层的视图，就是几张卡片在一起的视图
 2、这里还可以换一种思维就是，用表视图进行封装，我只封装自定义的 cell ,这一类其实是比较好做的。
 3、最后，可以考虑把做好的view,无缝切换到cell中去。
 */

/*
 今天早上的安排是： 用1个小时的时间写好这个自定义控件。
 然后接着 DOM 的学习。 1个小时
 下午接着学习。
 两点到六点，4个小时。
 加油。
 */


/*
 这里还需要考虑一个根据字符的长度去更改高度的需求。
 高度自适应的代码。用备忘录记录下来。然后有一个总结的帖子。
 */

/*
 现在这样看起来，xib 已经不具备优势了，因为已经花了好久的时间在布局上。
 建议今天用massory来进行布局。
 放弃这种布局的方法。
 
 */


#import <UIKit/UIKit.h>

// 详情页的卡片内容，样式
typedef NS_ENUM(NSInteger, DetailCardType){
    OnlyContents = 0,              // 只有文字内容
    TitleAndContents = 1,          // 左边标题，右边文字
    TitleAndContentsInTable = 2    // 被一个表格包起来的，左边标题，右边文字
};

@interface ProjectDetailsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *headTitleLabel; // 卡片的头部标题


@end
