//
//  BMQDateView.m
//  
//
//  Created by iecd on 15/11/11.
//
//

#import "BMQDateView.h"
#import "UIView+WF.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define BorderColor [UIColor colorWithRed:24/255.0 green:125/255.0 blue:232/255.0 alpha:1.0]
#define ButtonWidth 40
#define LeftMargin 15

@interface BMQDateView()

@property (nonatomic,strong) UIButton *controlButton;
@property (nonatomic,strong) UIView *controlView;
@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) UIView *view1;
@property (nonatomic,strong) UIView *view2;
@property (nonatomic,strong) UIView *view3;
@property (nonatomic,strong) UIButton *ConfirmButton;
@property (nonatomic,strong) UIButton *CancelButton;

@end


@implementation BMQDateView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景controlButton
        self.controlButton = [[UIButton alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.controlButton.backgroundColor = [UIColor darkTextColor];
        self.controlButton.alpha = 0.2;
        [self.controlButton addTarget:self action:@selector(removeSubviews:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.controlButton];

         //装DataView的容器view
        self.controlView= [[UIView alloc]init];
        self.controlView.backgroundColor = [UIColor whiteColor];
        self.controlView.layer.cornerRadius = 8.0;
        self.controlView.layer.masksToBounds = YES;
        self.controlView.layer.borderColor = BorderColor.CGColor;
        self.controlView.layer.borderWidth = 1.0;
        [self addSubview:self.controlView];
        
        //DataView标题
        self.titleLable = [[UILabel alloc]init];
        self.titleLable.text = @"请选择时间";
        self.titleLable.font = [UIFont systemFontOfSize:16.0];
        self.titleLable.textColor = BorderColor;
        [self.controlView addSubview:self.titleLable];
        
        //至今
        self.nowButton = [[UIButton alloc]init];
        [self.nowButton setTitle:@"至今" forState:UIControlStateNormal];
        [self.controlView addSubview:self.nowButton];
        self.nowButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [self.nowButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.nowButton setTitleColor:BorderColor forState:UIControlStateSelected];
        [self.nowButton addTarget:self action:@selector(nowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //隔离线1
        self.view1 = [[UIView alloc]init];
        self.view1.backgroundColor = BorderColor;
        [self.controlView addSubview:self.view1];
        
        //DatePicker
        self.datePicker = [[UIDatePicker alloc]init];
        self.datePicker.datePickerMode=UIDatePickerModeDate;
        self.datePicker.backgroundColor=[UIColor whiteColor];
        self.datePicker.maximumDate = [NSDate date];
        self.datePicker.minimumDate = [[NSDate  alloc]initWithTimeIntervalSinceNow:-365*60*24*60*60];
        [self.controlView addSubview:self.datePicker];
        
        //设置显示格式
        //默认模拟手机本地设置是中文还是英文
        NSLocale *local = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        self.datePicker.locale = local;
        
        //隔离线1
        self.view2 = [[UIView alloc]init];
        self.view2.backgroundColor = BorderColor;
        [self.controlView addSubview:self.view2];
        //隔离线2
        self.view3 = [[UIView alloc]init];
        self.view3.backgroundColor = BorderColor;
        
     
        [self.controlView addSubview:self.view3];
        
        //确认button
        self.ConfirmButton = [[UIButton alloc]init];
        self.ConfirmButton.backgroundColor = [UIColor whiteColor];
        self.ConfirmButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [self.ConfirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [self.ConfirmButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.ConfirmButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        self.ConfirmButton.tag =1;
      
        [self.ConfirmButton addTarget:self action:@selector(ConfirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.controlView addSubview:self.ConfirmButton];
        
        //取消button
        self.CancelButton = [[UIButton alloc]init];
        self.CancelButton.backgroundColor = [UIColor whiteColor];
        self.CancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [self.CancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.CancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [self.CancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];

        self.CancelButton.tag =2;
        [self.CancelButton addTarget:self action:@selector(ConfirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.controlView addSubview:self.CancelButton];
            }
   
    return self;
}


-(void)layoutSubviews{
    //view
    self.controlView.width = ScreenW-4*LeftMargin;
    self.controlView.height =250.0;
    self.controlView.centerX = self.centerX;
    self.controlView.centerY = self.centerY-50;
    
    //titleLable
    self.titleLable.width = self.controlView.width-3*LeftMargin-60;
    self.titleLable.height = ButtonWidth;
    self.titleLable.x = LeftMargin;
    self.titleLable.y = 0;
    
//    //至今(此版本暂时屏蔽)
//    self.nowButton.width = ButtonWidth+LeftMargin;
//    self.nowButton.height = ButtonWidth;
//    self.nowButton.x = self.controlView.width-LeftMargin-self.nowButton.width;
//    self.nowButton.y = 0;
    
    //隔离线1
    self.view1.width = self.controlView.width;
    self.view1.height = 1.0;
    self.view1.x = 0;
    self.view1.y = CGRectGetMaxY(self.titleLable.frame);
    
    //时间选择器
    self.datePicker.frame = CGRectMake(0, CGRectGetMaxY(self.view1.frame), self.controlView.width, self.controlView.height-100);

    //隔离线2
    self.view2.width = self.controlView.width-3*LeftMargin;
    self.view2.height = 1.0;
    self.view2.centerX = self.datePicker.centerX;
    self.view2.y = CGRectGetMaxY(self.datePicker.frame);
    
    //隔离线3
    self.view3.width = 1.0;
    self.view3.height = 40;
    self.view3.centerX = self.datePicker.centerX;
    self.view3.y = CGRectGetMaxY(self.view2.frame)+LeftMargin/2;
    
    //确认button
    self.ConfirmButton.width = self.view2.width /2.0 -self.view3.width ;
    self.ConfirmButton.height = ButtonWidth;
    self.ConfirmButton.x =  self.view2.x;
    self.ConfirmButton.y = CGRectGetMaxY(self.view2.frame)+LeftMargin/2;
    
    //取消button
    self.CancelButton.width = self.view2.width /2.0 -self.view3.width ;
    self.CancelButton.height = ButtonWidth;
    self.CancelButton.x = self.view3.x + self.view3.width;
    self.CancelButton.y = CGRectGetMaxY(self.view2.frame)+LeftMargin/2;
}

//至今button点击事件
-(void)nowButtonAction:(UIButton *)sender{
    if (sender.selected == NO) {
        sender.selected = YES;
    }else if(sender.selected == YES){
        sender.selected = NO;
    }
    if ([self.delegate respondsToSelector:@selector(dateView: setupDateString:)]) {
        [self.delegate dateView:self setupDateString:sender.titleLabel.text];
    }
    [self removeFromSuperview];
}

//确定和取消button点击事件
-(void)ConfirmButtonAction:(UIButton *)sender{
    
    if (sender.tag == 1) {
//        self.ConfirmButton.selected = YES;
//        self.CancelButton.selected = NO;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];

        [dateFormatter setDateFormat:@"yyyy-MM-dd"];

        self.dateString = [dateFormatter stringFromDate:self.datePicker.date];

        if ([self.delegate respondsToSelector:@selector(dateView: setupDateString:)]) {
            [self.delegate dateView:self setupDateString:self.dateString];
        }
    }else if(sender.tag == 2)   {
//        self.CancelButton.selected = YES;
//        self.ConfirmButton.selected = NO;
    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.ConfirmButton.selected = NO;
//        self.CancelButton.selected = NO;
        [self removeFromSuperview];
//    });
   
}

-(void)removeSubviews:(UIButton *)sender{
//    [sender removeFromSuperview];
    [self removeFromSuperview];
    
}

//标题设置
-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLable.text = title;
}

/**
 说明：从写button Selected方法,来判断设置的时开始时间还是结束时间
 */
-(void)setSelected:(BOOL)selected{
//    _selected = selected;
    if (!selected) {
        self.nowButton.enabled = NO;
    }else{
        self.nowButton.enabled = YES;
    }
}

/**
 说明：设置初始化显示时间
 */
-(void)setDefaultDateStr:(NSString *)defaultDateStr{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        NSDate *date = [dateFormatter dateFromString:defaultDateStr];
    if (date) {
          [self.datePicker setDate: date];
          _defaultDateStr = defaultDateStr;
    }
}

/**
 说明：BMQ私有方法:初始化显示时间
 */
-(void)setBMQDefaultDateString:(NSString *)BMQDefaultDateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSDate *date = [dateFormatter dateFromString:BMQDefaultDateString];
    if (date) {
        [self.datePicker setDate: date];
        _BMQDefaultDateString = BMQDefaultDateString;
    }else if (!date){
        [self.datePicker setDate:[NSDate date]];
    }
}


@end
