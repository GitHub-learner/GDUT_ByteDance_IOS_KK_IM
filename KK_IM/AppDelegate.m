//
//  AppDelegate.m
//  KK_IM
//
//  Created by Admin on 2021/6/23.
//



#import "AppDelegate.h"
#import "ViewController.h"
//#import "MainController.h"
#import "LoginController.h"
#import "HomeController.h"
#import "MainTabBarController.h"

@interface AppDelegate ()
//@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 设置程序的默认window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[LoginController alloc]init]];
    self.window.rootViewController = self.navigationController;
    // 显示window
    [self.window makeKeyAndVisible];
    return YES;
   
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStateChange:) name:ACCOUNT_LOGIN_CHANGED object:nil];

    
}






@end
