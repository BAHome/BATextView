//
//  UITextView+BAKit.h
//  BAQMUIDemo
//
//  Created by boai on 2017/5/31.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 实时监测 TextView 输入文字，并返回当前文字最大高度，以便做自适应高度

 @param current_textViewHeight 当前文字的最大高度
 */
typedef void (^BAKit_TextView_HeightDidChangedBlock)(CGFloat current_textViewHeight);

/**
 实时监测 TextView 输入文字，并返回当前文字字符个数

 @param current_wordNumber 当前文字的字符个数
 */
typedef void (^BAKit_TextView_WordDidChangedBlock)(NSInteger current_wordNumber);

@interface UITextView (BAKit)

/**
 placeholder：文字
 */
@property(nonatomic, strong) NSString *ba_placeholder;

/**
 placeholder：文字颜色
 */
@property(nonatomic, strong) UIColor *ba_placeholderColor;

/**
 placeholder：文字字体
 */
@property(nonatomic, strong) UIFont *ba_placeholderFont;

/**
 文字字体，注意：一定要用 ba_textFont 设置，用系统的 self.font 设置无效
 */
@property(nonatomic, strong) UIFont *ba_textFont;

/**
 文字颜色，注意：一定要用 ba_textColor 设置，用系统的 self.textColor 设置无效
 */
@property(nonatomic, strong) UIColor *ba_textColor;

/**
 最大高度，如果需要随文字改变高度的时候使用
 */
@property (nonatomic, assign) CGFloat ba_maxHeight;

/**
 最小高度，如果需要随文字改变高度的时候使用
 */
@property (nonatomic, assign) CGFloat ba_minHeight;

/**
 实时监测 TextView 输入文字，并返回当前文字最大高度，以便做自适应高度
 */
@property(nonatomic, copy) BAKit_TextView_HeightDidChangedBlock ba_textView_HeightDidChangedBlock;

/**
 最大字数限制
 */
@property (nonatomic, assign) NSInteger ba_maxWordLimitNumber;

/**
 实时监测 TextView 输入文字，并返回当前文字字符个数
 */
@property(nonatomic, copy) BAKit_TextView_WordDidChangedBlock ba_textView_WordDidChangedBlock;


/**
 是否为空

 @return YES，NO
 */
- (BOOL)ba_textView_isEmpty;

/**
 快速设定自动布局

 @param maxHeight 最大高度
 @param minHeight 最小高度
 @param block BAKit_TextView_HeightDidChangedBlock
 */
- (void)ba_textView_autoLayoutWithMaxHeight:(CGFloat)maxHeight
                                  minHeight:(CGFloat)minHeight
                                      block:(BAKit_TextView_HeightDidChangedBlock)block;

/**
 快速设定最大字数限制返回当前字数

 @param limitNumber 最大字数限制
 @param block BAKit_TextView_WordDidChangedBlock
 */
- (void)ba_textView_wordLimitWithMaxWordLimitNumber:(NSInteger)limitNumber
                                              block:(BAKit_TextView_WordDidChangedBlock)block;

@end
