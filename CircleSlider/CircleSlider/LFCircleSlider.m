//
//  CircleSlider.m
//  Cir
//
//  Created by Vicent on 14-3-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "LFCircleSlider.h"

@implementation LFCircleSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultData];
    }
    return self;
}

- (void)initDefaultData{
    _circleWidth = 14.0;
    _topColor = [UIColor greenColor];
    _bottomColor = [UIColor blackColor];
    _centerColor = [UIColor yellowColor];
    _centerRadius = self.bounds.size.width;
    _sliderBottomColor = [UIColor grayColor];
    _sliderWidth = 4.0;
    _progress = 0.8;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initDefaultData];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //fill the center
    UIBezierPath *fillCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) radius:(self.centerRadius - self.circleWidth) / 2 startAngle:(CGFloat) - M_PI_2 endAngle:(CGFloat)(2 * M_PI) clockwise:YES];
    [self.centerColor setFill];
    [fillCircle fill];
    
    //fill the stroke Of bottomCircle
    UIBezierPath *bottomCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2) radius:(CGRectGetWidth(self.bounds) - self.circleWidth) / 2 startAngle:(CGFloat) - M_PI_2 endAngle:(CGFloat)(1.5 * M_PI) clockwise:YES];
    [self.bottomColor setStroke];
    bottomCircle.lineWidth = self.circleWidth;
    [bottomCircle stroke];
    
    //add
    UIBezierPath *topCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2)
                                                             radius:(CGRectGetWidth(self.bounds) - self.circleWidth) / 2
                                                         startAngle:(CGFloat) - M_PI_2
                                                           endAngle:(CGFloat)(- M_PI_2 + 2 * M_PI)
                                                          clockwise:YES];
    [self.sliderBottomColor setStroke];
    topCircle.lineWidth = self.sliderWidth;
    [topCircle stroke];
    
    if (self.progress) {
        //fill the stroke Of topCircle
        UIBezierPath *topCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2)
                                                                 radius:(CGRectGetWidth(self.bounds) - self.circleWidth) / 2
                                                             startAngle:(CGFloat) - M_PI_2
                                                               endAngle:(CGFloat)(- M_PI_2 + self.progress * 2 * M_PI)
                                                              clockwise:YES];
        
        [self.topColor setStroke];
        topCircle.lineWidth = self.sliderWidth;
        [topCircle stroke];
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

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setNeedsDisplay];
}

-(void)dealloc{
    
    [self removeObserver:self forKeyPath:@"progress"];
}
@end
