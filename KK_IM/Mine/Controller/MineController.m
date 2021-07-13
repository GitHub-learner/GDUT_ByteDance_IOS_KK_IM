#import "MineController.h"
#import "Masonry.h"
@interface MineController()

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *logoutButton = [UIButton new];
    
    [logoutButton setTitle:@"logout" forState: UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [logoutButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:logoutButton];
    [logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.equalTo(self.view).offset(30);
        //make.right.equalTo(self.view).offset(-30);
        make.height.equalTo(@55);

        make.center.equalTo(self.view);
        //make.top.equalTo(self.view.mas_top).offset(96);
    }];
    
    [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) logout{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
    
