//
//  LFAlertController+BlurEffects.h
//  AlertControllerDemo
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LFAlertController.h"

typedef NS_ENUM(NSUInteger,BlurEffectStyle){
    BlurEffectStyleLight,
    BlurEffectStyleExtraLight,
    BlurEffectStyleDarkEffect,
};


@interface LFAlertController (BlurEffects)


- (void) setBlurEffectWithView:(UIView *)view;

- (void) setBlurEffectWithView:(UIView *)view style:(BlurEffectStyle)blurStyle;

- (void) setBlurEffectWithView:(UIView *)view effectTintColor:(UIColor *)effectTintColor;


@end
