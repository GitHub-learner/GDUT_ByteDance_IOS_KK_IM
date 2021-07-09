//
//  HomeController.m
//  IM-V2
//
//  Created by Admin on 2021/6/25.
//

//#import "LoginController.h"
#import "Masonry.h"
#import "HomeView.h"
#import "HomeController.h"
#import "LoginView.h"

@interface HomeController () <UITextFieldDelegate>

@property (nonatomic) BOOL isLogin;
@property (nonatomic, strong) HomeView *homeView;
@property (nonatomic) UIButton *btn;

@end

@implementation HomeController

#pragma mark - init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.isLogin = false;
    
    self.homeView = [[HomeView alloc]init];
    
    [self.view addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}





- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}


       
@end
