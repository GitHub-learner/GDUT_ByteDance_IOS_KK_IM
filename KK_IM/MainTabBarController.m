//
//  MainTabBarController.m
//  IM-V2
//
//  Created by Admin on 2021/6/26.
//

#import "MainTabBarController.h"

#import "Masonry.h"
#import "HomeView.h"
#import "ConversationsController.h"
#import "ContactsController.h"
#import "MineController.h"
#import "KMessagesViewController.h"

@interface MainTabBarController ()


//@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) ConversationsController *conversationsController;
@property (nonatomic, strong) ContactsController *contactsController;
@property (nonatomic, strong) MineController *mineController;


@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    self.conversationsController = [[ConversationsController alloc]init];
//    UITabBarItem *consItem = [self setupTabBarItemWithTitle:@"消息" imgName:@"icon-tab会话unselected" selectedImgName:@"icon-tab会话" ];
//    //UITabBarItem *consItem = [[UITabBarItem alloc]init];
//    //consItem.title = @"消息";
//    //consItem.image = [UIImage imageNamed:@"icon-tab会话unselected"];
//    consItem.badgeValue = @"123";
//    self.conversationsController.tabBarItem = consItem;
//    [self addChildViewController:self.conversationsController];
    
    UITabBarItem *consItem = [self setupTabBarItemWithTitle:@"消息" imgName:@"icon-tab会话unselected" selectedImgName:@"icon-tab会话" ];
    
    consItem.badgeValue = @"123";
    KMessagesViewController *messageViewController = [[KMessagesViewController alloc] init];
    messageViewController.tabBarItem = consItem;
    UINavigationController *conversationsNavigationController = [[UINavigationController alloc] initWithRootViewController:messageViewController];
    [self addChildViewController:conversationsNavigationController];
    
    
    self.contactsController = [[ContactsController alloc]init];
    UITabBarItem *contItem = [self setupTabBarItemWithTitle:@"通讯录" imgName:@"icon-tab通讯录unselected" selectedImgName:@"icon-tab通讯录"];
//    UITabBarItem* contItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    self.contactsController.tabBarItem = contItem;
    UINavigationController* contactsNavigationController = [[UINavigationController alloc]initWithRootViewController:self.contactsController];
    [self addChildViewController:contactsNavigationController];
    
    //UITabBarItem *discoverItem = [self _setupTabBarItemWithTitle:@"发现" imgName:@"icon-tab发现unselected" selectedImgName:@"icon-tab发现" tag:kTabbarItemTag_Settings];
    
    self.mineController = [[MineController alloc] init];
    UITabBarItem *mineItem = [self setupTabBarItemWithTitle:@"我的" imgName:@"icon-tab我unselected" selectedImgName:@"icon-tab我"];
    self.mineController.tabBarItem = mineItem;
    [self addChildViewController:self.mineController];
    
    
    //self.viewControllers = @[self.conversationsController, self.contactsController, self.mineController];
    
    
    
    //self.tabBar.selectedItem = consItem;
    //[self tabBar:self.tabBar didSelectItem:consItem];
}

- (UITabBarItem *)setupTabBarItemWithTitle:(NSString *)aTitle
                                    imgName:(NSString *)aImgName
                            selectedImgName:(NSString *)aSelectedImgName
                                        //tag:(NSInteger)aTag
{
    UITabBarItem *retItem = [[UITabBarItem alloc] initWithTitle:aTitle image:[UIImage imageNamed:aImgName] selectedImage:[UIImage imageNamed:aSelectedImgName]];
    //retItem.tag = aTag;
    
    [retItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:14], NSFontAttributeName, [UIColor lightGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [retItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13], NSFontAttributeName, [UIColor systemBlueColor],  NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    return retItem;
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
