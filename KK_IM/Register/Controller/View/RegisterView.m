//
//  RegisterView.m
//  KK_IM
//
//  Created by Admin on 2021/7/2.
//

#import "RegisterView.h"
#import "Masonry.h"

@interface RegisterView () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLable;


@end

@implementation RegisterView

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
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.image = [UIImage imageNamed:@"BootPage"];
//    [self.view insertSubview:imageView atIndex:0];
    
    self.backView = [[UIView alloc]init];
    //    self.backView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];


    self.titleLable = [[UILabel alloc] init];
    [self.backView addSubview:self.titleLable];
    self.titleLable.textColor = [UIColor systemBlueColor];


    self.titleLable.font = [UIFont systemFontOfSize:80];
    self.titleLable.text = @"注册";
    self.titleLable.textAlignment = NSTextAlignmentCenter;

    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView);
        make.top.equalTo(self.backView.mas_top).offset(96);
    }];

    
    self.usernameField = [[UITextField alloc] init];
    self.usernameField.keyboardType = UIKeyboardTypeDefault;
    self.usernameField.keyboardAppearance = UIKeyboardAppearanceDefault;
    self.usernameField.backgroundColor = [UIColor whiteColor];
    self.usernameField.delegate = self;
    // 边框样式
    self.usernameField.borderStyle = UITextBorderStyleNone;
    self.usernameField.placeholder = @"🆔";
    self.usernameField.returnKeyType = UIReturnKeyNext;
    self.usernameField.font = [UIFont systemFontOfSize:17];
    self.usernameField.rightViewMode = UITextFieldViewModeWhileEditing;
    // 右边的一键删除button
    self.usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.usernameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 18, 10)];
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameField.layer.cornerRadius = 25;
    self.usernameField.layer.borderWidth = 1;
    self.usernameField.layer.borderColor = [UIColor lightGrayColor].CGColor;


    [self.backView addSubview:self.usernameField];
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.titleLable.mas_bottom).offset(40);
        make.height.equalTo(@55);
    }];
    self.passwordField = [[UITextField alloc] init];
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.delegate = self;
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordField.placeholder = @"🔐";
    self.passwordField.font = [UIFont systemFontOfSize:17];
    self.passwordField.returnKeyType = UIReturnKeyJoin;
    // 密码🔐安全样式
    self.passwordField.secureTextEntry = YES;
    self.passwordField.clearsOnBeginEditing = NO;

    self.passwordField.rightViewMode = UITextFieldViewModeAlways;
    self.passwordField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 18, 10)];
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordField.layer.cornerRadius = 25;
    self.passwordField.layer.borderWidth = 1;
    self.passwordField.layer.borderColor = [UIColor lightGrayColor].CGColor;

    [self.backView addSubview:self.passwordField];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.usernameField.mas_bottom).offset(20);
        make.height.equalTo(@55);
    }];

    self.registerButton = [[UIButton alloc]init];
    [self.registerButton setTitle:@"注册" forState: UIControlStateNormal];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [self.registerButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    
    [self.backView addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(30);
        make.right.equalTo(self.backView).offset(-30);
        make.top.equalTo(self.passwordField.mas_bottom).offset(40);
        make.height.equalTo(@55);
    }];

    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.usernameField isFirstResponder]){
        [self.usernameField resignFirstResponder];
        [self.passwordField becomeFirstResponder];
    }
    else if([self.passwordField isFirstResponder]){
        [self.passwordField resignFirstResponder];
        //[self.loginButton becomeFirstResponder];
    }
    return YES;
}




@end






