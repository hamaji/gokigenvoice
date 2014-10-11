//
//  mypage.m
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/08/31.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "mypage.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface mypage (){
    
    CGPoint points[25];
    int level[5];
    UIView *chart;
    
    CAShapeLayer *redline;
    
    
}

@end

@implementation mypage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupPoints];
    
    [self setChartFrame];
    
    [self showGraph];
    
}


-(void)setupPoints{
    for(int i=0;i<25;i++)
    {
        float angle =(i/5)*(M_PI/2.5)-M_PI/2.0;
        float length =(i%5+1)*30;
        points[i] = CGPointMake(length*cos(angle)+160,length*sin(angle)+160);
    }
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    level[0]=appDelegate.woodPoint;
    level[1]=appDelegate.firePoint;
    level[2]=appDelegate.tuchiPoint;
    level[3]=appDelegate.goldPoint;
    level[4]=appDelegate.waterPoint;
}

-(void)setChartFrame
{
    chart =[[UIView alloc]initWithFrame:CGRectMake(0,180,320,310)];
    chart.backgroundColor =[UIColor colorWithWhite:1.9 alpha:1];
    chart.layer.borderColor = [UIColor whiteColor].CGColor;
    chart.layer.borderWidth =10;
    [self.view addSubview:chart];
    
    for(int i=0;i<25;i++)
    {
        UIView *mark=[[UIView alloc]initWithFrame:CGRectMake(0,0,3,3)];
        mark.layer.cornerRadius=1.5;
        mark.backgroundColor=[UIColor whiteColor];
        mark.center=points[i];
        [chart addSubview:mark];
    }
    
    UIBezierPath *outpath =[UIBezierPath bezierPath];
    for(int i=0;i<5;i++)
    {
        [outpath moveToPoint:points[i]];
        [outpath addLineToPoint:points[i+5]];
        [outpath addLineToPoint:points[i+10]];
        [outpath addLineToPoint:points[i+15]];
        [outpath addLineToPoint:points[i+20]];
        [outpath addLineToPoint:points[i]];
    }
    
    for(int i=0;i<5;i++){
        [outpath moveToPoint:CGPointMake(160,160)];
        [outpath addLineToPoint:points[i*5+4]];
    }
    
    CAShapeLayer *outline = [[CAShapeLayer alloc]init];
    outline.fillColor =[UIColor clearColor].CGColor;
    outline.strokeColor=[UIColor blackColor].CGColor;
    outline.lineWidth=1;
    outline.path =outpath.CGPath;
    
    
    [chart.layer addSublayer:outline];
}

-(void)showGraph{
    if(!redline){
        redline=[[CAShapeLayer alloc]init];
        redline.fillColor=[UIColor colorWithRed:0 green:1 blue:0 alpha:0.3].CGColor;
        redline.strokeColor=[UIColor blueColor].CGColor;
        redline.lineWidth = 3;
        [chart.layer addSublayer:redline];
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:points[level[0]-1]];
    [path addLineToPoint:points[level[1]+4]];
    [path addLineToPoint:points[level[2]+9]];
    [path addLineToPoint:points[level[3]+14]];
    [path addLineToPoint:points[level[4]+19]];
    [path addLineToPoint:points[level[0]-1]];
    
    redline.path =path.CGPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
