//
//  UIView+LFAlertView.h
//  TLFInPark
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFAlertController.h"
#import "LFShowAlertView.h"

@interface UIView (LFAlertView)


+ (instancetype) createViewFromNib;

+ (instancetype) createViewFromNibName:(NSString *)nibName;

- (UIViewController *)viewController;

#pragma mark - show in controller
- (void)showInController:(UIViewController *)viewController;

- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle;

- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimation:(LFAlertTransitionAnimation)transitionAnimation;


- (void)showInController:(UIViewController *)viewController preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimation:(LFAlertTransitionAnimation)transitionAnimation backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;


#pragma mark - show in window
- (void) showInWindow;

// backgoundTapDismissEnable default NO
- (void)showInWindowWithBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showInWindowWithOriginY:(CGFloat)OriginY;

- (void)showInWindowWithOriginY:(CGFloat)OriginY backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;


#pragma mark - hide
- (void)hideView;

- (void)hideInController;

- (void)hideInWindow;




@end
