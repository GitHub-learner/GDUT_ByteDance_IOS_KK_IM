//
//  KKNetConnect.h
//  KK_IM
//
//  Created by Admin on 2021/6/24.
//
#import <AFNetworking.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKNetConnect : NSObject
#pragma mark -方法
//请求的URL
-(instancetype) initWithUrl:(NSString*)url;

//改变请求的URL
-(void) changURL:(NSString*)newURL;

//具体请求函数
-(void) sendBody:(NSDictionary*)body finishBlock:( void (^) (NSDictionary*))finish;

//判断用户是否存在，
//@pram userAccount 账号，finishBlock 获取返回结果后的操作。
- (void)senduserAccountCheckIfExists:(NSString *)account finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

//用户进行登陆的请求
-(void) senduserAccount:(NSString*)account andPassword:(NSString*)passWord finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

//用户进行注册的请求
-(void) senduserNickName:(NSString*)nickName andUserId:(NSString*)userId andPassword:(NSString*)passWord finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

//获取用户信息
-(void) getUserInfoForUserId:(NSString*)userId finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

//添加好友的请求
-(void) sendFriendId:(NSString*)friendAccount finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

#pragma mark -属性


@end


NS_ASSUME_NONNULL_END
