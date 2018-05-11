//
//  LFAlertController.h
//  TLFInPark
//
//  Created by mac on 2018/4/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFAlertView.h"

typedef NS_ENUM(NSInteger,LFAlertControllerStyle) {
    LFAlertControllerStyleAlert = 0,
    LFAlertControllerStyleActionSheet,
};

typedef NS_ENUM(NSInteger,LFAlertTransitionAnimation) {
    LFAlertTransitionAnimationFade = 0,
    LFAlertTransitionAnimationScaleFade,
    LFAlertTransitionAnimationDropDown,
    LFAlertTransitionAnimationCustom
};

@interface LFAlertController : UIViewController

@property (nonatomic, strong, readonly) UIView *alertView;

@property (nonatomic, strong) UIColor *backgroundColor; // set backgroundColor
@property (nonatomic, strong) UIView *backgroundView; // you set coustom view to it

@property (nonatomic, assign, readonly) LFAlertControllerStyle preferredStyle;

@property (nonatomic, assign, readonly) LFAlertTransitionAnimation transitionAnimation;

@property (nonatomic, assign, readonly) Class transitionAnimationClass;

@property (nonatomic, assign) BOOL backgoundTapDismissEnable;  // default NO

@property (nonatomic, assign) CGFloat alertViewOriginY;  // default center Y

@property (nonatomic, assign) CGFloat alertStyleEdging; //  when width frame equal to 0,or no width constraint ,this proprty will use, default to 15 edge
@property (nonatomic, assign) CGFloat actionSheetStyleEdging; // default 0

// alertView lifecycle block
@property (copy, nonatomic) void (^viewWillShowHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewDidShowHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewWillHideHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewDidHideHandler)(UIView *alertView);

// dismiss controller completed block
@property (nonatomic, copy) void (^dismissComplete)(void);

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LFAlertControllerStyle)preferredStyle;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimation:(LFAlertTransitionAnimation)transitionAnimation;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LFAlertControllerStyle)preferredStyle transitionAnimationClass:(Class)transitionAnimationClass;

- (void)dismissViewControllerAnimated: (BOOL)animated;


@end
/*
 关于iOS 转场动画的一些理解
 UIViewControllerTransitioningDelegate 自定义模态转场动画时使用。
 设置UIViewController的属性transitioningDelegate。
 @property (nullable, nonatomic, weak) id <UIViewControllerTransitioningDelegate> transitioningDelegate
 

 */

// Transition Animate
@interface LFAlertController (TransitionAnimate)<UIViewControllerTransitioningDelegate>

@end

