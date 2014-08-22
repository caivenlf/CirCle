//
//  CircleSlider.m
//  Cir
//
//  Created by Vicent on 14-3-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCircularProgressView : UIView
//是否开启动画，默认不开启
@property (nonatomic,assign)BOOL shake;
@property(nonatomic, strong) UIColor *trackTintColor;
@property(nonatomic, strong) UIColor *progressTintColor;
@property(nonatomic, strong) UIColor *progressTint1Color;
// Range [0,1]
@property (nonatomic, assign) CGFloat progress;

// progress 线宽
@property (nonatomic, assign) CGFloat lineWidth;
// progress 线宽
@property (nonatomic, assign) CGFloat line1Width;
// trace 线宽
@property (nonatomic, assign) CGFloat trackLineWidth;
// trace和progress圆的间距
@property (nonatomic, assign) CGFloat space;

@end
