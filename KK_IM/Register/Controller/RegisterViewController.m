//
//  RegisterViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "Masonry.h"

@interface RegisterViewController ()

@property (nonatomic,strong) RegisterView* registerView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.registerView = [[RegisterView alloc]init];
    
    
    [self.view addSubview:self.registerView];
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
    [self.registerView.usernameField addTarget:self.registerView action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerView.passwordField addTarget:self.registerView action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.registerView.registerButton addTarget:self.registerView action:@selector(registe) forControlEvents:UIControlEventTouchUpInside];
    
}

// 文本框变化时执行, 判断账号密码是否都存在
- (void) textChange {
    if (self.registerView.usernameField.text.length > 0 && self.registerView.passwordField.text.length > 0) {
        self.registerView.registerButton.enabled = YES;
    }else {
        self.registerView.registerButton.enabled = NO;
    }
}

- (void) registe {
    // TODO: 补全注册逻辑
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
