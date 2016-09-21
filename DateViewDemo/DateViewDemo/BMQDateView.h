//
//  BMQDateView.h
//  
//
//  Created by iecd on 15/11/11.
//
//

#import <UIKit/UIKit.h>
@class BMQDateView;
@protocol BMQDateViewDelegate <NSObject>
- (void)dateView:(BMQDateView *)dateView setupDateString:(NSString *)dateString;
@end


@interface BMQDateView : UIView

@property(strong,nonatomic)id<BMQDateViewDelegate> delegate;

/** 时间字符串  */
@property(nonatomic,strong) NSString *dateString;

/**说明:标志，复用标记*/
@property(nonatomic,strong) NSString *flag;

/**
 说明：弹框的标题
 */
@property(nonatomic,strong) NSString *title;

/**
 说明：初始化时间，第一次显示的时间
 ,格式:yyyy-MM-dd
 */
@property(nonatomic,strong) NSString *defaultDateStr;


/**
 说明：BMQ私用接口
 */
@property(nonatomic,strong) NSString *BMQDefaultDateString;

/**
 说明：至今button
 */
@property (nonatomic,strong) UIButton *nowButton;

/**
 说明：至今选择状态
 */
@property(nonatomic,assign) BOOL selected;


@end
