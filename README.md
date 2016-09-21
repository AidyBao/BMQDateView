# BMQDateView
一个几行代码就实现的时间选择器

#import "ViewController.h"
#import "BMQDateView.h"

@interface ViewController ()<BMQDateViewDelegate>
@property (strong, nonatomic) BMQDateView *dateView;//自定义时间
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateView.title =@"请选择培训开始时间";
    self.dateView.BMQDefaultDateString = @"2011-01-10";
    [self.view addSubview:self.dateView];
    
}


#pragma mark BMQDateViewdelegate
-(void)dateView:(BMQDateView *)dateView setupDateString:(NSString *)dateString{
    NSLog(@"%@",dateString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BMQDateView *)dateView{
    if (_dateView == nil) {
        _dateView = [[BMQDateView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        _dateView.delegate = self;
    }
    return _dateView;
}

