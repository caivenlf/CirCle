//
//  ViewController.h
//  CircleSlider
//
//  Created by Vincent on 14-8-22.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFCircularProgressView.h"
#import "LFCircleSlider.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet LFCircularProgressView *circleSlider;

@property (weak, nonatomic) IBOutlet LFCircleSlider *secCircleSlider;
@end
