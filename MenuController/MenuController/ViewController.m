//
//  ViewController.m
//  MenuController
//
//  Created by wpzyc on 2017/7/3.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet ZYCLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadHTMLString:@"<div>哈哈哈</.div>" baseURL:nil];
    
    [self.label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)]];
}



- (void)labelClick
{
    
    
    //1.label要成为第一响应者(告诉menuController支持哪些操作，这些操作如何处理)
    [self.label becomeFirstResponder];
    //2.显示menuController
    UIMenuController * menu = [UIMenuController sharedMenuController];
    //targetRect:menuController需要指向的矩形框
    //tagetView:targetRect会以tagetView的左上角为坐标原点
    //    [menu setTargetRect:self.frame inView:self.superview];
    
    //添加menuItem（点击item默认会调用控制器的方法）
    UIMenuItem *ding = [[UIMenuItem alloc]initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem *reply = [[UIMenuItem alloc]initWithTitle:@"回复" action:@selector(reply:)];
    UIMenuItem *report = [[UIMenuItem alloc]initWithTitle:@"举报" action:@selector(report:)];
    menu.menuItems = @[ding,reply,report];
    
    [menu setTargetRect:self.label.bounds inView:self.label];
    [menu setMenuVisible:YES animated:YES];

}
     
- (void)ding:(UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}
- (void)reply:(UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}
- (void)report:(UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
