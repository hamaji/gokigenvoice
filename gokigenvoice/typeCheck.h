//
//  typeCheck.h
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/08/31.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface typeCheck : UIViewController
{
    int questionNum;
    int woodPoint;
    int firePoint;
    int tuchiPoint;
    int goldPoint;
    int waterPoint;
    NSString *msg[36];
}
- (IBAction)tapYes:(id)sender;
- (IBAction)tapNo:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *checkResult;
@property (weak, nonatomic) IBOutlet UITextView *questionView;
@property (weak, nonatomic) IBOutlet UIButton *btnYes;
@property (weak, nonatomic) IBOutlet UIButton *btnNo;
@property (weak, nonatomic) IBOutlet UILabel *lbQuetNum;
@end
