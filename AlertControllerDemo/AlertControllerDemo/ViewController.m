//
//  ViewController.m
//  AlertControllerDemo
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LFAlertView.h"
#import "ShareView.h"
#import "SettingModelView.h"
#import "LFAlertController+BlurEffects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)alertViewInControllerClick:(id)sender {
    
    LFAlertView *alertView = [LFAlertView alertViewWithTitle:@"LFAlertView" message:@"This is a message, the alert view containt text and textfiled."];
    [alertView addAction:[LFAlertAction actionWithTitle:@"取消" style:LFAlertActionStyleCancel handler:^(LFAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    // 弱引用alertView 否则 会循环引用
    __typeof (alertView) __weak weakAlertView = alertView;
    [alertView addAction:[LFAlertAction actionWithTitle:@"确定" style:LFAlertActionStyleDestructive handler:^(LFAlertAction *action) {
        
        NSLog(@"%@",action.title);
        for (UITextField *textField in weakAlertView.textFieldArray) {
            NSLog(@"%@",textField.text);
        }
    }]];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入账号";
    }];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入密码";
    }];
    
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:alertView preferredStyle:LFAlertControllerStyleAlert];
    
    [alertController setViewWillShowHandler:^(UIView *alertView) {
        NSLog(@"ViewWillShow");
    }];
    
    [alertController setViewDidShowHandler:^(UIView *alertView) {
        NSLog(@"ViewDidShow");
    }];
    
    [alertController setViewWillHideHandler:^(UIView *alertView) {
        NSLog(@"ViewWillHide");
    }];
    
    [alertController setViewDidHideHandler:^(UIView *alertView) {
        NSLog(@"ViewDidHide");
    }];
    
    [alertController setDismissComplete:^{
        NSLog(@"DismissComplete");
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (IBAction)blurEffectAlertViewClkc:(id)sender {
    ShareView *shareView = [ShareView createViewFromNib];
    
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:shareView preferredStyle:LFAlertControllerStyleAlert];
    [alertController setBlurEffectWithView:self.view];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)dropDownAnimationClick:(id)sender {
    
    LFAlertView *alertView = [LFAlertView alertViewWithTitle:@"dropDown" message:@"This is a message, the alert view containt dropdwon animation. "];
    [alertView addAction:[LFAlertAction actionWithTitle:@"取消" style:LFAlertActionStyleCancel handler:^(LFAlertAction *action) {
        NSLog(@"取消");
    }]];
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:alertView preferredStyle:LFAlertControllerStyleAlert transitionAnimation:LFAlertTransitionAnimationDropDown];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)ActionSheetClick:(id)sender {
    LFAlertView *alertView = [LFAlertView alertViewWithTitle:@"TYAlertView" message:@"This is a message, the alert view style is actionsheet. "];
    
    [alertView addAction:[LFAlertAction actionWithTitle:@"默认2" style:LFAlertActionStyleDefault handler:^(LFAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    [alertView addAction:[LFAlertAction actionWithTitle:@"默认1" style:LFAlertActionStyleDefault handler:^(LFAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    [alertView addAction:[LFAlertAction actionWithTitle:@"删除" style:LFAlertActionStyleDestructive handler:^(LFAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    [alertView addAction:[LFAlertAction actionWithTitle:@"取消" style:LFAlertActionStyleCancel handler:^(LFAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:alertView preferredStyle:LFAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)customActionSheetClick:(id)sender {
    SettingModelView *settingModelView = [SettingModelView createViewFromNib];
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:settingModelView preferredStyle:LFAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)AlertViewWindowClick:(id)sender {
    LFAlertView *alertView = [LFAlertView alertViewWithTitle:@"LFAlertView" message:@"A message should be a short, but it can support long message, hahahhahahahahhahahahahhaahahhahahahahahhahahahahhahahahahahhahahahahahhahahahhahahhahahahahh. (NSTextAlignmentCenter)"];
    
    [alertView addAction:[LFAlertAction actionWithTitle:@"取消" style:LFAlertActionStyleCancel handler:^(LFAlertAction *action) {
        
    }]];
    
    [alertView addAction:[LFAlertAction actionWithTitle:@"确定" style:LFAlertActionStyleDestructive handler:^(LFAlertAction *action) {
        
    }]];
    
    // first way to show ,use UIView Category
    [alertView showInWindowWithOriginY:200 backgoundTapDismissEnable:YES];
}

- (IBAction)CustomViewInWindow:(id)sender {
    
    ShareView *shareView = [ShareView createViewFromNib];
    
    // use UIView Category
    [shareView showInWindow];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
