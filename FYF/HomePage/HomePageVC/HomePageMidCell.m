//
//  HomePageMidCell.m
//  FYF
//
//  Created by 徐书传 on 16/4/13.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "HomePageMidCell.h"

#define BottomBtnHeight 140
#define IconBtnWidth 80

@interface HomePageMidCell ()
@property (nonatomic,strong) UIButton *leftBottomBtn;
@property (nonatomic,strong) UIButton *rightBottomBtn;

@property (nonatomic,strong) UIButton *leftIconBtn;
@property (nonatomic,strong) UIButton *rightIconBtn;

@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *rightLabel;
 
@end

@implementation HomePageMidCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.leftBottomBtn addSubview:self.leftIconBtn];
        [self.rightBottomBtn addSubview:self.rightIconBtn];
        [self addSubview:self.leftBottomBtn];
        [self addSubview:self.rightBottomBtn];
        
        [self.leftIconBtn setFrame:RECT(((SCREENWIDTH - 1)/2.0 - IconBtnWidth)/2.0, (BottomBtnHeight - IconBtnWidth)/2.0 - 10, IconBtnWidth, IconBtnWidth)];
        [self.leftIconBtn setImage:[UIImage imageNamed:@"sao"] forState:UIControlStateNormal];
        [self.leftLabel setFrame:RECT(0, self.leftIconBtn.y + self.leftIconBtn.height, (SCREENWIDTH - 1)/2.0, 15)];
        [self addSubview:self.leftLabel];
        
        [self addSubview:[self getLineViewWithFrame:RECT((SCREENWIDTH - 1)/2.0, 0, 1, BottomBtnHeight)]];
        
        
        [self.rightIconBtn setFrame:RECT(((SCREENWIDTH - 1)/2.0 - IconBtnWidth)/2.0, (BottomBtnHeight - IconBtnWidth)/2.0 - 10, IconBtnWidth, IconBtnWidth)];
        [self.rightIconBtn setImage:[UIImage imageNamed:@"jifen"] forState:UIControlStateNormal];
        [self.rightLabel setFrame:RECT((SCREENWIDTH - 1)/2.0,  self.rightIconBtn.y + self.rightIconBtn.height , (SCREENWIDTH - 1)/2.0, 15)];
        [self addSubview:self.rightLabel];

    }
    return self;
}

+(CGFloat)getCellHeight
{
    return BottomBtnHeight;
}

#pragma -mark -----Getter-----

-(UIButton *)leftBottomBtn
{
    if (!_leftBottomBtn) {
        _leftBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBottomBtn setFrame:CGRectMake(0, 0, (SCREENWIDTH - 1)/2.0, BottomBtnHeight)];

    }
    return _leftBottomBtn;
}

-(UIButton *)rightBottomBtn
{
    if (!_rightBottomBtn) {
        _rightBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBottomBtn setFrame:CGRectMake((SCREENWIDTH - 1)/2.0 + 1, 0, (SCREENWIDTH - 1)/2.0, BottomBtnHeight)];
    }
    return _rightBottomBtn;
}

-(UIButton *)leftIconBtn
{
    if (!_leftIconBtn) {
        _leftIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _leftIconBtn;
}


-(UIButton *)rightIconBtn
{
    if (!_rightIconBtn) {
        _rightIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    }
    return _rightIconBtn;
}

-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = SystemFont(20);
        _leftLabel.textColor = RGBCOLOR(24, 126, 189);
        _leftLabel.text = @"扫一扫";
        _leftLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _leftLabel;
}

-(UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = SystemFont(20);
        _rightLabel.textColor = RGBCOLOR(253, 167, 56);
        _rightLabel.text = @"积分兑换";
        _rightLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _rightLabel;
}

@end
