//
//  LFAlertController+TransitionAnimate.m
//  TLFInPark
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LFAlertController.h"
#import "LFAlertFadeAnimation.h"
#import "LFAlertScaleFadeAnimation.h"
#import "LFAlertDropDownAnimation.h"

@implementation LFAlertController (TransitionAnimate)




- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    switch (self.transitionAnimation) {
        case LFAlertTransitionAnimationFade:
            return [LFAlertFadeAnimation alertAnimationIsPresenting:YES];
            break;
        case LFAlertTransitionAnimationScaleFade:
            return [LFAlertScaleFadeAnimation alertAnimationIsPresenting:YES];
        case LFAlertTransitionAnimationDropDown:
            return [LFAlertDropDownAnimation alertAnimationIsPresenting:YES];
        case LFAlertTransitionAnimationCustom:
            return [self.class alertAnimationIsPresenting:YES preferredStyle:self.preferredStyle];
        default:
            break;
    }
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    switch (self.transitionAnimation) {
        case LFAlertTransitionAnimationFade:
            return [LFAlertFadeAnimation alertAnimationIsPresenting:NO];
        case LFAlertTransitionAnimationScaleFade:
            return [LFAlertScaleFadeAnimation alertAnimationIsPresenting:NO];
        case LFAlertTransitionAnimationDropDown:
            return [LFAlertDropDownAnimation alertAnimationIsPresenting:NO];
        case LFAlertTransitionAnimationCustom:
            return [self.class alertAnimationIsPresenting:NO preferredStyle:self.preferredStyle];
        default:
            return nil;
    }
}


@end
