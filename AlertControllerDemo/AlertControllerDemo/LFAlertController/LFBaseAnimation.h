//
//  LFBaseAnimation.h
//  TLFInPark
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFAlertController.h"

@interface LFBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign, readonly) BOOL isPresenting; // present . dismiss

+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting;

// if you only want alert or actionsheet style ,you can judge that you don't need and return nil
//  code : only support alert style
//  if (preferredStyle == TYAlertControllerStyleAlert) {
//      return [super alertAnimationIsPresenting:isPresenting];
//  }
//  return nil;
+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting preferredStyle:(LFAlertControllerStyle) preferredStyle;


// override transiton time
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;

// override present
- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

// override dismiss
- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;
@end
