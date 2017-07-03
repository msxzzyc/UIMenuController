//
//  ZYCLabel.m
//  MenuController
//
//  Created by wpzyc on 2017/7/3.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCLabel.h"

@implementation ZYCLabel

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setUp];
    }
    return self;
}

- (void)setUp

{
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)]];
    
}//使label有资格成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    
    return YES;
    
}
/**
 *label能执行哪些操作 return yes支持这些操作
 
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(cut:)||action == @selector(copy:)||action == @selector(paste:)) return YES;
    return NO;
    
}
- (void)cut:(UIMenuController *)menu
{
    //将自己的文字保存到粘贴板
    [self copy:menu];
    //清空文字
    self.text = nil;
    
    
    
}
- (void)copy:(UIMenuController *)menu
{
    //将自己的文字保存到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
    
    
}
- (void)paste:(UIMenuController *)menu
{
    
    //将粘贴板的文字复制到自己上
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    self.text = board.string;
    
}
- (void)labelClick
{
    //1.label要成为第一响应者(告诉menuController支持哪些操作，这些操作如何处理)
    [self becomeFirstResponder];
    //2.显示menuController
    UIMenuController * menu = [UIMenuController sharedMenuController];
    //targetRect:menuController需要指向的矩形框
    //tagetView:targetRect会以tagetView的左上角为坐标原点
//    [menu setTargetRect:self.frame inView:self.superview];
    [menu setTargetRect:self.bounds inView:self];
    
    [menu setMenuVisible:YES animated:YES];
}
@end
