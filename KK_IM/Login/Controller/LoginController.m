//
//  LoginViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/25.
//

#import "LoginController.h"
#import "LoginView.h"

#import "RegisterViewController.h"
#import "MainPageViewController.h"
#import "UserInfoModel.h"
#import "infoArchive.h"
#import "Masonry.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"


@interface LoginController () <UITextFieldDelegate>
@property (strong, nonatomic) LoginView* loginView;

@end

@implementation LoginController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.loginView = [[LoginView alloc]init];
    
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    

    // Do any additional setup after loading the view.
    [self.loginView.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.loginView.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.loginView.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

// 监听文本框


// 文本框变化时执行, 判断账号密码是否都存在
- (void) textChange {
    if (self.loginView.usernameField.text.length > 0 && self.loginView.passwordField.text.length > 0) {
        self.loginView.loginButton.enabled = YES;
    }else {
        self.loginView.loginButton.enabled = NO;
    }
}



- (void) login {
    //创建链接，指定相应URL
    KKNetConnect* conn = [[KKNetConnect alloc]initWithUrl:@"https://qczgqv.fn.thelarkcloud.com/ifUserExist"];
    //异步发送请求，成功后返回主线程执行finish函数
    [conn senduserAccountCheckIfExists:self.loginView.usernameField.text finishBlock:^(NSDictionary * _Nonnull res) {
        
        [self verifyExist:res andConnect:conn];
        
    }];
}

//被login调用，当判断用户存在时的回调函数
-(void) verifyExist:(NSDictionary*)res andConnect:(KKNetConnect*)conn{
    //存在用户
    if ([res[@"result"]  isEqual:  @(YES)]){
        //去验证密码
        [conn changURL:@"https://qczgqv.fn.thelarkcloud.com/MatchUserPassword"];
        //发送请求
        [conn senduserAccount:self.loginView.usernameField.text andPassword:self.loginView.passwordField.text finishBlock:^(NSDictionary * _Nonnull loginRes) {
            [self verifySuccess:loginRes andConnect:conn];
        }];
            
        }else {
            //不存在用户
            NSLog(@"账号未注册！");
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"该账号未注册，你要注册该账号吗？" preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //跳转至注册页面
                AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
                [appDelegate.navigationController pushViewController:[[RegisterViewController alloc]init] animated:YES];
                //[self performSegueWithIdentifier:@"register" sender:nil];
            }];
            [alertController addAction:okAction];
            
            // 即便“取消”Style后添加，还是默认出现在左边
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
}

//被verifyExist调用，当判断密码正确时的回调函数
-(void) verifySuccess:(NSDictionary*)loginRes andConnect:(KKNetConnect*)conn{
    //成功匹配密码
    if([loginRes[@"result"] isEqual:@(YES) ]){
        NSLog(@"密码正确！");
        
        MainTabBarController* mainTabBarController = [[MainTabBarController alloc]init];
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [appDelegate.navigationController pushViewController:mainTabBarController animated:YES];
        
        //进入主页面之前，获取个人信息并归档。
        [conn changURL:@"https://qczgqv.fn.thelarkcloud.com/getUserInfo"];
        [conn getUserInfoForUserId:self.loginView.usernameField.text finishBlock:^(NSDictionary * _Nonnull userInfo) {
            //下面是进行归档

            infoArchive* archiver = [infoArchive new];

            [archiver archiveMyInfo:userInfo];
            
        }];
        
        /*  TODO： 归档个人用户信息的数据  */
        //[self performSegueWithIdentifier:@"loginSegue" sender:nil];
    }else{
        //不匹配
        NSLog(@"账号密码不匹配！");
    }
}

//// 将值通过segue传递
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString: @"register"]) {
//        RegisterViewController *theVc = segue.destinationViewController;
//        theVc.username = self.loginView.usernameField.text;
//        theVc.password = self.loginView.passwordField.text;
//    }
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}



@end
