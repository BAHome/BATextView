//
//  BATextView.h
//  BATextView
//
//  Created by boai on 2017/6/1.
//  Copyright © 2017年 boai. All rights reserved.
//

#ifndef BATextView_h
#define BATextView_h

#import "UITextView+BAKit.h"

#define BAKit_Objc_setObj(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

#define BAKit_Objc_setObjCOPY(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY)

#define BAKit_Objc_getObj objc_getAssociatedObject(self, _cmd)

#define BAKit_Objc_exchangeMethodAToB(methodA,methodB) method_exchangeImplementations(class_getInstanceMethod([self class], methodA),class_getInstanceMethod([self class], methodB));

#pragma mark - NotiCenter
#define BAKit_NotiCenter [NSNotificationCenter defaultCenter]

/*!
 *  获取屏幕宽度和高度
 */
#define BAKit_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define BAKit_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#pragma mark - weak / strong
#define BAKit_WeakSelf        @BAKit_Weakify(self);
#define BAKit_StrongSelf      @BAKit_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@BAKit_Weakify`实现弱引用转换，`@BAKit_Strongify`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef BAKit_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define BAKit_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define BAKit_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define BAKit_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define BAKit_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@BAKit_Weakify(object)`实现弱引用转换，`@BAKit_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify(object)
 * [obj block:^{
 * @BAKit_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef BAKit_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 欢迎使用 BAHome 系列开源代码 ！
 如有更多需求，请前往：https://github.com/BAHome
 
 项目源码地址：
 OC 版 ：https://github.com/BAHome/BATextView
 
 最新更新时间：2017-05-27 【倒叙】
 最新Version：【Version：1.0.0】
 更新内容：
 1.0.0.1、可以自定义 placeholder的(字体、颜色)、文字(字体、颜色)
 1.0.0.2、可以自定义 输入文字的(字体、颜色)、文字(字体、颜色)
 1.0.0.3、可以自动布局，自适应高度，实时监测输入文字的最大高度
 1.0.0.4、可以实时监测输入文字的最大个数，可以限制最大输入文字字数
 1.0.0.5、用分类整理，无需改动源码即可实现各种自定义功能

*/

#endif /* BATextView_h */
