//
//  LoginView.m
//  IM-V2
//
//  Created by Admin on 2021/6/25.
//

#import "LoginController.h"
#import "Masonry.h"
#import "LoginView.h"
#import "KKNetConnect.h"
#import "HomeController.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface LoginController () <UITextFieldDelegate>

@property (nonatomic) BOOL isLogin;
@property (nonatomic, strong) LoginView *loginView;


@end

@implementation LoginController

#pragma mark - init

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.isLogin = false;
    
    self.loginView = [[LoginView alloc]init];
    
    [self.loginView.loginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

-(void)loginClick:(UIButton*)sender{
    
    NSString *nameString = self.loginView.nameField.text;
    NSString *passwordString = self.loginView.passwordField.text;
    
    KKNetConnect* connect = [[KKNetConnect alloc]initWithUrl:(@"https://qczgqv.fn.thelarkcloud.com/MatchUserPassword")];
    NSDictionary* body = @{@"password":passwordString,@"userId": nameString};
    NSLog(@"%@", body);
    [connect sendBody:body finishBlock:^(NSDictionary * _Nonnull dict ) {
        NSLog(@"%@", [dict[@"result"] class] );
        if(dict[@"result"]){
//            NSLog(@"【+】");
            
            MainTabBarController* mainTabBarController = [[MainTabBarController alloc]init];
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            [appDelegate.navigationController pushViewController:mainTabBarController animated:YES];
        }
    }];
    
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


       
@end
