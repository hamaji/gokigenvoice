//
//  AppDelegate.h
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/06/22.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int questionNum;
    int woodPoint;
    int firePoint;
    int tuchiPoint;
    int goldPoint;
    int waterPoint;
    int selectedType;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) int woodPoint;
@property (nonatomic, assign) int firePoint;
@property (nonatomic, assign) int tuchiPoint;
@property (nonatomic, assign) int goldPoint;
@property (nonatomic, assign) int waterPoint;
@property (nonatomic, assign) int selectedType;
@end
