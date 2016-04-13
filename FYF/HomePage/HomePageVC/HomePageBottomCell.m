//
//  HomePageBottomCell.m
//  FYF
//
//  Created by 徐书传 on 16/4/13.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "HomePageBottomCell.h"
#define BtnHeight 180
#define BtnWidth SCREENWIDTH/3.0

@interface HomePageBottomCell ()
@property (nonatomic,strong) UIButton *chuyuBtn;
@property (nonatomic,strong) UIButton *qitaBtn;
@property (nonatomic,strong) UIButton *kehuishouBtn;
@property (nonatomic,strong) UIImageView *bottomImageView;

@end

@implementation HomePageBottomCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.bottomImageView];
        [self addSubview:self.chuyuBtn];
        [self addSubview:self.qitaBtn];
        [self addSubview:self.kehuishouBtn];
        
    }
    return self;
}


+(CGFloat)getCellHeight
{
    return BtnHeight;
}

#pragma -mark ----Getter-----

-(UIButton *)chuyuBtn
{
    if (!_chuyuBtn) {
        _chuyuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chuyuBtn setFrame:CGRectMake(0, 0, BtnWidth, BtnHeight)];
        [_chuyuBtn setImage:[UIImage imageNamed:@"ic_m02_iv_kitchen"] forState:UIControlStateNormal];
        [_chuyuBtn addTarget:self action:@selector(categoryBtnAciton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chuyuBtn;
}

-(UIButton *)qitaBtn
{
    if (!_qitaBtn) {
        _qitaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qitaBtn setFrame:CGRectMake(BtnWidth, 0, BtnWidth, BtnHeight)];
        [_qitaBtn setImage:[UIImage imageNamed:@"ic_m02_iv_other"] forState:UIControlStateNormal];
        [_qitaBtn addTarget:self action:@selector(categoryBtnAciton:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _qitaBtn;
}

-(UIButton *)kehuishouBtn
{
    if (!_kehuishouBtn) {
        _kehuishouBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_kehuishouBtn setFrame:CGRectMake(BtnWidth *2 , 0, BtnWidth, BtnHeight)];
        [_kehuishouBtn setImage:[UIImage imageNamed:@"ic_m02_iv_recyclable"] forState:UIControlStateNormal];
        [_kehuishouBtn addTarget:self action:@selector(categoryBtnAciton:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _kehuishouBtn;
}

-(UIImageView *)bottomImageView
{
    if (!_bottomImageView) {
        _bottomImageView = [[UIImageView alloc] init];
        _bottomImageView.backgroundColor = KColorGray2;
    }
    return _bottomImageView;
}

#pragma - mark -----Aciton----

-(void)categoryBtnAciton:(UIButton *)btn
{
    if (btn == _chuyuBtn) {
        
    }
    else if (btn == _qitaBtn)
    {
    
    }
    else if (btn == _kehuishouBtn)
    {
    
    }
    else
    {
        
    }
}

@end
