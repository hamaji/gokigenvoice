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
    
    CGPoint points[35];
    int level[5];
    UIView *chart;
    
    CAShapeLayer *redline;
    
    
}

@end

@implementation mypage

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupPoints];
    
    [self setChartFrame];
    
    [self showGraph];
    
}


-(void)setupPoints{
    
    //グラフのポイント点を作成
    for(int i=0;i<35;i++)
    {
        float angle =(i/7)*(M_PI/2.5)-M_PI/2.0;
        float length =(i%7+1)*20;
        
        points[i] = CGPointMake(length*cos(angle)+160,length*sin(angle)+160);
    }
    
    //成績を持ってくる
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    //level[0]=appDelegate.woodPoint;
    //level[1]=appDelegate.firePoint;
    //level[2]=appDelegate.tuchiPoint;
    //level[3]=appDelegate.goldPoint;
    //level[4]=appDelegate.waterPoint;
    
    level[0]=7;
    level[1]=7;
    level[2]=7;
    level[3]=7;
    level[4]=7;
}

-(void)setChartFrame
{
    chart =[[UIView alloc]initWithFrame:CGRectMake(0,180,320,310)];
    chart.backgroundColor =[UIColor colorWithWhite:1.9 alpha:1];
    chart.layer.borderColor = [UIColor whiteColor].CGColor;
    chart.layer.borderWidth =10;
    [self.view addSubview:chart];
    
    for(int i=0;i<35;i++)
    {
        UIView *mark=[[UIView alloc]initWithFrame:CGRectMake(0,0,3,3)];
        mark.layer.cornerRadius=1.5;
        mark.backgroundColor=[UIColor whiteColor];
        mark.center=points[i];
        [chart addSubview:mark];
    }
    
    UIBezierPath *outpath =[UIBezierPath bezierPath];
    for(int i=0;i<7;i++)
    {
        [outpath moveToPoint:points[i]];
        [outpath addLineToPoint:points[i+7]];
        [outpath addLineToPoint:points[i+14]];
        [outpath addLineToPoint:points[i+21]];
        [outpath addLineToPoint:points[i+28]];
        [outpath addLineToPoint:points[i]];
    }
    
    for(int i=0;i<5;i++){
        [outpath moveToPoint:CGPointMake(160,160)];
        [outpath addLineToPoint:points[i*7+6]];
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
    [path addLineToPoint:points[level[1]+6]];
    [path addLineToPoint:points[level[2]+13]];
    [path addLineToPoint:points[level[3]+20]];
    [path addLineToPoint:points[level[4]+27]];
    [path addLineToPoint:points[level[0]-1]];
    
    redline.path =path.CGPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
