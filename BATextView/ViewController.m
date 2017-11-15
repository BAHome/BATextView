//
//  ViewController.m
//  BATextView
//
//  Created by boai on 2017/6/1.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "ViewController.h"
#import "BATextView.h"

#pragma mark - 根据文字内容、宽度和字体返回 size
CG_INLINE CGSize
BAKit_LabelSizeWithTextAndWidthAndFont(NSString *text, CGFloat width, UIFont *font){
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    //    if (![text isKindOfClass:[NSString class]] || ![text isKindOfClass:[NSAttributedString class]])
    //    {
    //        NSLog(@"text 错误，此功能仅限 NSString / NSAttributedString 类型！");
    //        return CGSizeZero;
    //    }
    CGRect frame = [text boundingRectWithSize:size
                                      options:
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style} context:nil];
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return newFrame.size;
}
CG_INLINE UIColor *
BAKit_Color_RGB(u_char r,u_char g, u_char b) {
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}
#define BAKit_Color_Gray_11  BAKit_Color_RGB(248, 248, 248)

@interface ViewController ()

@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;

@property(nonatomic, strong) UITextView *textView1;

@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, assign) CGFloat textView_Height;

@property(nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"BATextView";
    
    self.label1.hidden = NO;
    self.label2.hidden = NO;
    self.textView1.hidden = NO;
    self.textView.hidden = NO;
    self.testView.hidden = NO;
    self.label3.hidden = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    
    min_x = 20;
    min_y = 80;
    min_w = BAKit_SCREEN_WIDTH - min_x * 2;
    min_h = BAKit_LabelSizeWithTextAndWidthAndFont(_label1.text, min_w, _label1.font).height;
    
    _label1.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_y = CGRectGetMaxY(_label1.frame) + 10;
    min_h = 60;
    
    _textView1.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_y = CGRectGetMaxY(_textView1.frame) + 10;
    min_h = _label1.frame.size.height;
    
    _label2.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    if (!self.textView_Height)
    {
        self.textView_Height = 40;
    }
    min_y = CGRectGetMaxY(_label2.frame) + 10;
    min_h = self.textView_Height;
    _textView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_y = CGRectGetMaxY(_textView.frame) + 10;
    min_h = 20;
    _testView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_y = CGRectGetHeight(_textView.frame) - 20;
    min_h = 15;
    min_w = [_label3 sizeThatFits:CGSizeMake(CGFLOAT_MAX, min_h)].width;
    min_x = CGRectGetWidth(_textView.frame) - min_w - 10;
    _label3.frame = CGRectMake(min_x, min_y, min_w, min_h);

}

- (UILabel *)label1
{
    if (!_label1)
    {
        _label1 = [UILabel new];
        _label1.text = @"1、textView 正常情况，自定义holder（颜色、字体），自定义文字（颜色、字体）";
        _label1.numberOfLines = 0;
        _label1.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:_label1];
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2)
    {
        _label2 = [UILabel new];
        _label2.text = @"2、textView 自动布局，自定义holder（颜色、字体），自定义文字（颜色、字体）";
        _label2.numberOfLines = 0;
        _label2.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:_label2];
    }
    return _label2;
}

- (UITextView *)textView1
{
    if (!_textView1)
    {
        _textView1 = [UITextView new];
        _textView1.backgroundColor = BAKit_Color_Gray_11;
        /**
         文字字体，注意：一定要用 ba_textFont 设置，用系统的 self.font 设置无效
         */
        _textView1.ba_textFont = [UIFont systemFontOfSize:13];
        /**
         文字颜色，注意：一定要用 ba_textColor 设置，用系统的 self.textColor 设置无效
         */
        _textView1.ba_textColor = [UIColor purpleColor];
        
        _textView1.backgroundColor = BAKit_Color_Gray_11;
        // 自定义 placeholder
        _textView1.ba_placeholder = @"这里是 placeholder ！";
        // 自定义 placeholder 颜色
        _textView1.ba_placeholderColor = [UIColor greenColor];
        // 自定义 placeholder 字体
        _textView1.ba_placeholderFont = [UIFont systemFontOfSize:16];
        
        [self.view addSubview:_textView1];
    }
    return _textView1;
}

- (UITextView *)textView
{
    if (!_textView)
    {
        _textView = [UITextView new];
        _textView.userInteractionEnabled = YES;
        /**
         文字字体，注意：一定要用 ba_textFont 设置，用系统的 self.font 设置无效
         */
        _textView.ba_textFont = [UIFont systemFontOfSize:13];
        /**
         文字颜色，注意：一定要用 ba_textColor 设置，用系统的 self.textColor 设置无效
         */
        _textView.ba_textColor = [UIColor redColor];
        
        _textView.backgroundColor = BAKit_Color_Gray_11;
        // 自定义 placeholder
        _textView.ba_placeholder = @"这里是 placeholder ！";
        // 自定义 placeholder 颜色
        _textView.ba_placeholderColor = [UIColor orangeColor];
        // 自定义 placeholder 字体
        _textView.ba_placeholderFont = [UIFont systemFontOfSize:25];
        
        /**
         快速设定自动布局
         
         @param maxHeight 最大高度
         @param minHeight 最小高度
         @param block BAKit_TextView_HeightDidChangedBlock
         */
        BAKit_WeakSelf
        [_textView ba_textView_autoLayoutWithMaxHeight:100 minHeight:60 block:^(CGFloat current_textViewHeight) {
            BAKit_StrongSelf
            self.textView_Height = current_textViewHeight;
            [self.view setNeedsLayout];
        }];
        
        /**
         快速设定最大字数限制返回当前字数
         
         @param limitNumber 最大字数限制
         @param block BAKit_TextView_WordDidChangedBlock
         */
        [_textView ba_textView_wordLimitWithMaxWordLimitNumber:10 block:^(NSInteger current_wordNumber) {
            BAKit_StrongSelf
            dispatch_async(dispatch_get_main_queue(), ^{
                self.label3.text = [NSString stringWithFormat:@"%ld/%ld", (long)current_wordNumber, (long)self.textView.ba_maxWordLimitNumber];
                [self.view setNeedsLayout];
            });
        }];
        [self.view addSubview:self.textView];
    }
    return _textView;
}

- (UILabel *)label3
{
    if (!_label3)
    {
        _label3 = [UILabel new];
        _label3.font = [UIFont systemFontOfSize:12];
        _label3.backgroundColor = [UIColor yellowColor];
        _label3.textColor = [UIColor blackColor];
        self.label3.text = [NSString stringWithFormat:@"%d/%ld", 0, (long)self.textView.ba_maxWordLimitNumber];

        [self.textView addSubview:_label3];
    }
    return _label3;
}

- (UIView *)testView
{
    if (!_testView)
    {
        _testView = [UIView new];
        _testView.backgroundColor = [UIColor cyanColor];
        
        [self.view addSubview:_testView];
    }
    return _testView;
}


@end
