//
//  CircleSlider.m
//  Cir
//
//  Created by Vicent on 14-3-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "LFCircularProgressView.h"

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

@interface LFCircularProgressView ()

@end

@implementation LFCircularProgressView

- (void)initDefaultData{
    self.backgroundColor = [UIColor clearColor];
    _lineWidth = 1.0f;
    _line1Width = 8;
    _progress = .0f;
    _space = 8;
    
    _trackTintColor = [UIColor blackColor];
    _progressTintColor = [UIColor redColor];
    _progressTint1Color = [UIColor greenColor];
    [self animationCircle];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultData];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initDefaultData];
}

- (void)drawRect:(CGRect)rect{
    // Drawing code
    CGPoint centerPoint = CGPointMake(rect.size.height / 2, rect.size.width / 2);
    CGFloat radius = (MIN(rect.size.height - _space, rect.size.width - _space) - _lineWidth) / 2;
    if (radius < .0f) {
        radius = .0f;
    }
    
    _trackLineWidth = rect.size.width / 2;
    
    CGFloat trackRadius = (MIN(rect.size.height, rect.size.width) - _trackLineWidth) / 2;
    
    UIBezierPath *trackCircle = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                               radius:trackRadius
                                                           startAngle:DEGREES_TO_RADIANS(0.0f)
                                                             endAngle:DEGREES_TO_RADIANS(360.0f)
                                                            clockwise:YES];
    [_trackTintColor setStroke];
    trackCircle.lineWidth = _trackLineWidth;
    [trackCircle stroke];
    
    UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                  radius:radius
                                                              startAngle:DEGREES_TO_RADIANS(0.0f)
                                                                endAngle:DEGREES_TO_RADIANS(360.0f)
                                                               clockwise:YES];
    [_progressTintColor setStroke];
    progressCircle.lineWidth = _lineWidth;
    [progressCircle stroke];
    
    if (_progress >= 0) {
        CGFloat radius1 = (MIN(rect.size.height - _space, rect.size.width - _space) - _lineWidth - _line1Width) / 2;
        if (radius1 < .0f) {
            radius1 = .0f;
        }
        CGFloat startDegrees = 270.0f;
        float tempDegrees = _progress * 360.0f;
        CGFloat endDegrees = (tempDegrees < 90) ? 270 + tempDegrees : tempDegrees - 90;
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                      radius:radius1
                                                                  startAngle:DEGREES_TO_RADIANS(startDegrees)
                                                                    endAngle:DEGREES_TO_RADIANS(endDegrees)
                                                                   clockwise:YES];
        [_progressTint1Color setStroke];
        progressCircle.lineWidth = _line1Width;
        [progressCircle stroke];
    }
    
}

- (void)setShake:(BOOL)shake{
    if (shake) {
        [self animationCircle];
        shake = NO;
    }
}

- (void)animationCircle{

    [self.layer removeAnimationForKey:@"popup"];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CGFloat scale = 0.03f;
    NSValue *scale1Value = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f + scale, 1.0f + scale, 1.0f)];
    NSValue *scale2Value = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f - scale, 1.0f - scale, 1.0f)];
    NSValue *scale3Value = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)];
    NSArray *frameValues = [NSArray arrayWithObjects:scale1Value, scale2Value, scale3Value, nil];
    [animation setValues:frameValues];
    
    NSNumber *time1 = [NSNumber numberWithFloat:.3f];
    NSNumber *time2 = [NSNumber numberWithFloat:.6f];
    NSNumber *time3 = [NSNumber numberWithFloat:1.0f];
    NSArray *frameTimes = [NSArray arrayWithObjects:time1, time2, time3, nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.duration = 0.2f;
    
    [self.layer addAnimation:animation forKey:@"popup"];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if (_progress >= 0.9999999f ) {
        _progress = 0.9999999f;
    }
    [self setNeedsDisplay];
}

@end
