//
//  LFShowAlertView.m
//  TLFInPark
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LFShowAlertView.h"
#import "UIView+LFAutoLayout.h"

@interface LFShowAlertView ()

@property (nonatomic,weak) UIView *alertView;
@property (nonatomic,weak) UITapGestureRecognizer *signleTap;

@end

#define kCurrentWindow [[UIApplication sharedApplication].windows firstObject]

@implementation LFShowAlertView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _backgroundTapDismissEnabled = NO;
        _alertViewEdging = 15;
        
        [self addBackgroundView];
        
        [self addSignleGesture];
        
    }
    return self;
}


- (void)addBackgroundView {
    if (_backgroundView == nil) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _backgroundView = backgroundView;
    }
    [self insertSubview:_backgroundView atIndex:0];
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    //添加约束
    [self addConstraintToView:_backgroundView edgeInset:UIEdgeInsetsZero];;
}


//添加手势
- (void)addSignleGesture {
    
    self.userInteractionEnabled = YES;
    //单指单击
    UITapGestureRecognizer *signleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    signleTap.enabled = _backgroundTapDismissEnabled;
    //添加响应者
    [_backgroundView addGestureRecognizer:signleTap];
    _signleTap = signleTap;
}

//手势点击事件
- (void)singleTap:(UITapGestureRecognizer *)sender {
    [self hide];
}

- (instancetype) initWithAlertView:(UIView *)tipView {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        [self addSubview:tipView];
        _alertView = tipView;
    }
    return self;
}

+ (instancetype) alertViewWithView:(UIView *)alertView {
    return [[self alloc] initWithAlertView:alertView];
}

+ (void)showAlertviewWithView:(UIView *)alertView {
    [self showAlertViewWithView:alertView backgoundTapDismissEnable:NO];
}

+ (void)showAlertViewWithView:(UIView *)alertView backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    LFShowAlertView *showTipView = [self alertViewWithView:alertView];
    showTipView.backgroundTapDismissEnabled = backgoundTapDismissEnable;
    [showTipView show];
}

+ (void)showAlertViewWithView:(UIView *)alertView originY:(CGFloat)originY {
    [self showAlertViewWithView:alertView originY:originY backgoundTapDismissEnable:NO];
}

+ (void)showAlertViewWithView:(UIView *)alertView originY:(CGFloat)originY backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    LFShowAlertView *showTipView = [self alertViewWithView:alertView];
    showTipView.alertViewOriginY = originY;
    showTipView.backgroundTapDismissEnabled = backgoundTapDismissEnable;
    [showTipView show];
}

- (void)setBackgroundView:(UIView *)backgroundView {
    if (_backgroundView != backgroundView) {
        [_backgroundView removeFromSuperview];
        _backgroundView = backgroundView;
        [self addBackgroundView];
        [self addSignleGesture];
    }
}

- (void)setBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable
{
    _backgroundTapDismissEnabled = backgoundTapDismissEnable;
    _signleTap.enabled = backgoundTapDismissEnable;
}

- (void)didMoveToSuperview {
    if (self.superview) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self.superview addConstraintToView:self edgeInset:UIEdgeInsetsZero];
        [self layoutAlertView];
    }
}

- (void) layoutAlertView {
    _alertView.translatesAutoresizingMaskIntoConstraints = NO;
    //设置中心点
    [self addConstraintCenterXToView:_alertView centerYToView:nil];
    
    //width heigth
    if (!CGSizeEqualToSize(_alertView.frame.size,CGSizeZero)) {
        [_alertView addConstraintWidth:CGRectGetWidth(_alertView.frame) height:CGRectGetHeight(_alertView.frame)];
    }else {
        BOOL findAlertViewWidthConstraint = NO;
        for (NSLayoutConstraint *constraint in _alertView.constraints) {
            if (constraint.firstAttribute == NSLayoutAttributeWidth) {
                findAlertViewWidthConstraint = YES;
                break;
            }
        }
        
        if (!findAlertViewWidthConstraint) {
            [_alertView addConstraintWidth:CGRectGetWidth(self.superview.frame)-2*_alertViewEdging height:0];
        }
    }
    
    // topY
    NSLayoutConstraint *alertViewCenterYConstraint = [self addConstraintCenterYToView:_alertView constant:0];
    
    if (_alertViewOriginY > 0) {
        [_alertView layoutIfNeeded];
        alertViewCenterYConstraint.constant = _alertViewOriginY - (CGRectGetHeight(self.superview.frame) - CGRectGetHeight(_alertView.frame))/2;
    }
}

- (void) show {
    if (self.superview == nil) {
        [kCurrentWindow addSubview:self];
    }
    self.alpha = 0;
    _alertView.transform = CGAffineTransformScale(_alertView.transform, 0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        _alertView.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
}


- (void) hide {
    if (self.superview) {
        [UIView animateWithDuration:0.3 animations:^{
            _alertView.transform = CGAffineTransformScale(_alertView.transform,0.1,0.1);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}


- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

@end

















