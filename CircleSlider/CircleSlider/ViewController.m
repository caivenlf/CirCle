//
//  ViewController.m
//  CircleSlider
//
//  Created by Vincent on 14-8-22.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_secCircleSlider setBottomColor:[UIColor redColor]];
    [_secCircleSlider setShake:YES];
    [_circleSlider setProgress:0.5];
    [_circleSlider setShake:YES];
    [_circleSlider setProgressTint1Color:[UIColor greenColor]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
