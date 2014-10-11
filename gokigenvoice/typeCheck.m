//
//  typeCheck.m
//  gokigenvoice
//
//  Created by 濱地 康平 on 2014/08/31.
//  Copyright (c) 2014年 myname. All rights reserved.
//

#import "typeCheck.h"
#import "mypage.h"
#import "AppDelegate.h"

@interface typeCheck (){

}

@end

@implementation typeCheck


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setQuestion];
    self.questionView.text =msg[0];
    questionNum=0;
    woodPoint=0;
    firePoint=0;
    tuchiPoint=0;
    goldPoint=0;
    waterPoint=0;
    self.checkResult.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapYes:(id)sender {
    if( questionNum == 1 || questionNum == 3 || questionNum ==6)
    {
        woodPoint++;
    }
    else if (questionNum ==7)
    {
        firePoint++;
    }
    else if(questionNum==14 ||questionNum==15 || questionNum ==18 || questionNum ==20 )
    {
        tuchiPoint++;
    }
    else if (questionNum==21 || questionNum==23)
    {
        goldPoint++;
    }
    else if (questionNum==28 ||questionNum==29)
    {
        waterPoint++;
    }
    [self nextQuestion];
}

- (IBAction)tapNo:(id)sender {
    if( questionNum == 0 || questionNum == 2 || questionNum==4||questionNum == 5)
    {
        woodPoint++;
    }
    else if (8 <=questionNum && questionNum<=13)
    {
        firePoint++;
    }
    else if(questionNum==16  || questionNum==17 || questionNum ==19)
    {
        tuchiPoint++;
    }
    else if (questionNum==22 || (24<=questionNum && questionNum<=27))
    {
        goldPoint++;
    }
    else if (30<=questionNum && questionNum<=34)
    {
        waterPoint++;
    }
    [self nextQuestion];
}

-(void)nextQuestion{
    
    
    questionNum++;
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    if(questionNum !=36)
    {
        self.lbQuetNum.text = [NSString stringWithFormat:@"第%d問", questionNum+1];
    }
    self.questionView.text =msg[questionNum];
    if (questionNum==35)
    {
        questionNum=0;
        self.checkResult.hidden = NO;
        self.btnYes.hidden =YES;
        self.btnNo.hidden =YES;
        
        if(woodPoint >5) woodPoint=5;
        if(firePoint >5) firePoint=5;
        if(tuchiPoint >5) tuchiPoint=5;
        if(goldPoint >5) goldPoint=5;
        if(waterPoint >5) waterPoint=5;
        if(woodPoint <1) woodPoint=1;
        if(firePoint <1) firePoint=1;
        if(tuchiPoint <1) tuchiPoint=1;
        if(goldPoint <1) goldPoint=1;
        if(waterPoint <1) waterPoint=1;
        appDelegate.woodPoint = woodPoint;
        appDelegate.firePoint = firePoint;
        appDelegate.tuchiPoint= tuchiPoint;
        appDelegate.goldPoint = goldPoint;
        appDelegate.waterPoint = waterPoint;
    }
}

-(void)setQuestion{
    msg[0] = @"言いたいことがうまく言えない。";
    msg[1] = @"ストレッチ体操は得意なほうだ。";
    msg[2] = @"慢性的な肩こりや腰痛がある。";
    msg[3] = @"歩くときは踵から足を出す。";
    msg[4] = @"思い詰めるタイプだ。";
    msg[5] = @"頻繁に頭が重いと感じる。";
    msg[6] = @"人前ではいつも笑顔でいるようにしている。";
    msg[7] = @"一日に一回は思いきり伸びをする。";
    msg[8] = @"首や肩がよく凝る。";
    msg[9] = @"テンションが高い人がちょっと苦手。";
    msg[10] = @"声がこもっていると感じる。";
    msg[11] = @"なんとなくやる気が出ない。";
    msg[12] = @"どちらかというと猫背。";
    msg[13] = @"高い声が出しにくいと感じる。";
    msg[14] = @"ダンスは得意（リズム感に自信がある）。";
    msg[15] = @"目立つのが嫌い。";
    msg[16] = @"声に抑揚がないと感じる。";
    msg[17] = @"ぼーとしていることがよくある。";
    msg[18] = @"足の指でグー•チョキ•パーができる。";
    msg[19] = @"下半身よりも上半身に力が入るほうだ。";
    msg[20] = @"空気を読むのが得意だ。";
    msg[21] = @"決断力はあるほうだ。";
    msg[22] = @"自分には何かが足りないと感じる。";
    msg[23] = @"運はいいほうだと思う。";
    msg[24] = @"周り（環境）のせいにしてしまうことがよくある。";
    msg[25] = @"～しなければならないとよく言う、またはよく思う。";
    msg[26] = @"許すことが苦手。";
    msg[27] = @"人に甘えたり、任せたりするのが苦手。";
    msg[28] = @"どちらかというと内向的。";
    msg[29] = @"自分ワールドを持っている。";
    msg[30] = @"力を抜くのが苦手。";
    msg[31] = @"つい早口になってしまう。";
    msg[32] = @"重心が踵よりも爪先のほうにある。";
    msg[33] = @"計画どおりに物事を進めたいほうだ。";
    msg[34] = @"息を長く吐くことが苦手。";
    msg[35] = @"診断ボタンを押してください";
    

}
@end
