//
//  ViewController.m
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/06/22.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    CGPoint points[25];
    int level[5];
    UIView *chart;

    CAShapeLayer *redline;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupPoints];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupPoints
{
    
}
@end
