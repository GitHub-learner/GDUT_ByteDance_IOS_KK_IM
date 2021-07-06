#import "LoginController.h"
#import "Masonry.h"
#import "LoginView.h"
#import "ConversationsController.h"

@interface ConversationsController ()



@end

@implementation ConversationsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // 设置vc的背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 创建一个textLabel，控件左上角坐标为(50,50),width=300，height=50
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 300, 50)];
    // 设置textLabel控件的文字内容
    [textLabel setText:@"ConversationsView!"];
    // 设置textLabel字体颜色
    [textLabel setTextColor:[UIColor redColor]];
    // 设置textLabel控件的边框，线条宽度、颜色
    [textLabel.layer setBorderWidth:2];
    [textLabel.layer setBorderColor:[[UIColor redColor] CGColor]];
    // 最后添加到vc的view中
    [self.view addSubview:textLabel];
    
}

@end
