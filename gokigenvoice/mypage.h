//
//  mypage.h
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/08/31.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mypage : UIViewController{
    int woodPoint;
    int firePoint;
    int tuchiPoint;
    int goldPoint;
    int waterPoint;
}
@property (weak, nonatomic) IBOutlet UILabel *presisu;

@end
