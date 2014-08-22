//
//  CircleSlider.h
//  Cir
//
//  Created by Vicent on 14-3-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCircleSlider : UIView
//是否开启动画，默认不开启
@property (nonatomic,assign)BOOL shake;
//外圈的width
@property (nonatomic,assign)CGFloat circleWidth;
//Slider的width
@property (nonatomic,assign)CGFloat sliderWidth;
//slider的色值
@property (nonatomic,strong)UIColor *topColor;
//边缘色值
@property (nonatomic,strong)UIColor *bottomColor;
//slider底层色值
@property (nonatomic,strong)UIColor *sliderBottomColor;
//大圆色值
@property (nonatomic,strong)UIColor *centerColor;
@property (nonatomic,assign)CGFloat centerRadius;
@property (nonatomic,assign)CGFloat progress;

@end
