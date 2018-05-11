//
//  UIView+LFAlertView.m
//  TLFInPark
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIView+LFAlertView.h"

@implementation UIView (LFAlertView)

+ (instancetype)createViewFromNibName:(NSString *)nibName {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    return [nib objectAtIndex:0];
}


+ (instancetype)createViewFromNib {
    return [self createViewFromNibName:NSStringFromClass(self.class)];
}


- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


#pragma mark - show in window
- (void) showInWindow {
    [self showInWindowWithBackgoundTapDismissEnable:NO];
}


- (void) showInWindowWithBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [LFShowAlertView showAlertViewWithView:self backgoundTapDismissEnable:backgoundTapDismissEnable];
}

- (void)showInWindowWithOriginY:(CGFloat)OriginY {
    [self showInWindowWithOriginY:OriginY backgoundTapDismissEnable:NO];
}



- (void)showInWindowWithOriginY:(CGFloat)OriginY backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [LFShowAlertView showAlertViewWithView:self originY:OriginY backgoundTapDismissEnable:backgoundTapDismissEnable];
}

- (void) hideInWindow {
    if ([self isShowInWindow]) {
        [(LFShowAlertView *)self.superview hide];
    }else {
        NSLog(@"self.superview is nil, or isn't LFShowAlertView");
    }
}

- (BOOL)isShowInWindow {
    if (self.superview && [self.superview isKindOfClass:[LFShowAlertView class]]) {
        return YES;
    }
    return NO;
}


#pragma mark - show in controller
- (void) showInController:(UIViewController *)viewController {
    [self showInController:viewController preferredStyle:LFAlertControllerStyleAlert transitionAnimation:LFAlertTransitionAnimationFade];
}

- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle {
    [self showInController:viewController preferredStyle:preferredStyle transitionAnimation:LFAlertTransitionAnimationFade];
}

- (void) showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    [self showInController:viewController preferredStyle:preferredStyle transitionAnimation:LFAlertTransitionAnimationFade backgoundTapDismissEnable:backgoundTapDismissEnable];
}


- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimation:(LFAlertTransitionAnimation)transitionAnimation
{
    [self showInController:viewController preferredStyle:preferredStyle transitionAnimation:transitionAnimation backgoundTapDismissEnable:NO];
}

- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimation:(LFAlertTransitionAnimation)transitionAnimation backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    LFAlertController *alertController = [LFAlertController alertControllerWithAlertView:self preferredStyle:preferredStyle transitionAnimation:transitionAnimation];
    alertController.backgoundTapDismissEnable = backgoundTapDismissEnable;
    [viewController presentViewController:alertController animated:YES completion:nil];
}


- (void) hideInController {
    if ([self isShowInAlertController]) {
        [(LFAlertController *)self.viewController dismissViewControllerAnimated:YES];
    }else {
        NSLog(@"self.viewController is nil, or isn't TYAlertController");
    }
}

#pragma mark - hide

- (BOOL)isShowInAlertController
{
    UIViewController *viewController = self.viewController;
    if (viewController && [viewController isKindOfClass:[LFAlertController class]]) {
        return YES;
    }
    return NO;
    
}


- (void)hideView {
    if ([self isShowInAlertController]) {
        [self hideInController];
    }else if ([self isShowInWindow]) {
        [self hideInWindow];
    }else {
        NSLog(@"self.viewController is nil, or isn't TYAlertController,or self.superview is nil, or isn't TYShowAlertView");
    }
}

@end
