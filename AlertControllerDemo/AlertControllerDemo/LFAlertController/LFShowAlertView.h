//
//  LFShowAlertView.h
//  TLFInPark
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFShowAlertView : UIView

@property (nonatomic,weak,readonly) UIView *alertView;
@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,assign) BOOL backgroundTapDismissEnabled;
@property (nonatomic,assign) CGFloat alertViewOriginY;
@property (nonatomic,assign) CGFloat alertViewEdging;

+ (void)showAlertviewWithView:(UIView *)alertView;

+ (void)showAlertViewWithView:(UIView *)alertView backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

+(void)showAlertViewWithView:(UIView *)alertView originY:(CGFloat)originY;

+(void)showAlertViewWithView:(UIView *)alertView originY:(CGFloat)originY backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

+ (instancetype)alertViewWithView:(UIView *)alertView;

- (void)show;

- (void)hide;

@end
