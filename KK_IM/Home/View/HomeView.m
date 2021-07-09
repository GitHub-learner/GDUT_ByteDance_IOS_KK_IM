//
//  View.m
//  IM-V2
//
//  Created by Admin on 2021/6/25.
//

#import "LoginView.h"
#import "Masonry.h"
#import "HomeView.h"
#import "ConversationsController.h"
#import "ContactsController.h"
#import "MineController.h"


@interface HomeView ()

@property (nonatomic, strong) UITabBar *tabBar;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) ConversationsController *conversationsController;
@property (nonatomic, strong) ContactsController *contactsController;
@property (nonatomic, strong) MineController *mineController;

@end

@implementation HomeView

- (instancetype)init
{
    if(self = [super init]){
        [self setupSubviews];
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if(self = [super initWithFrame:frame]){
//        [self setupSubviews];
//    }
//    return self;
//}



#pragma mark - Subviews

- (void)setupSubviews
{
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        [self setEdgesForExtendedLayout: UIRectEdgeNone];
//    }
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.tabBar = [[UITabBar alloc] init];
    self.tabBar.delegate = self;
    self.tabBar.translucent = NO;
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tabBar];
    [self.tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(50);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.tabBar addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabBar.mas_top);
        make.left.equalTo(self.tabBar.mas_left);
        make.right.equalTo(self.tabBar.mas_right);
        make.height.equalTo(@1);
    }];
    
    [self setupChildController];
}



- (void)setupChildController
{

}

@end
