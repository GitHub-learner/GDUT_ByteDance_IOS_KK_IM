//
//  KKNetConnect.m
//  KK_IM
//
//  Created by Admin on 2021/6/24.
//

#import "KKNetConnect.h"


@interface KKNetConnect ()
#pragma mark -属性
@property (nonatomic, strong)AFHTTPSessionManager* manager;
@property (nonatomic, copy)NSString* url;


@end

#pragma mark -实现
@implementation KKNetConnect

- (AFHTTPSessionManager *)manager{
    //懒加载
    if(!_manager){
        _manager = [AFHTTPSessionManager manager];
        //发送数据json解析
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //返回数据json解析
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

-(instancetype) initWithUrl:(NSString*)url {
    if(self = [super init]){
        self.url = url;
    }
    
    return self;
}

-(void) sendBody:(NSDictionary*)body finishBlock:( void (^) (NSDictionary*))finish{
//    __block NSDictionary* res ;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.manager POST:self.url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            dispatch_async(dispatch_get_main_queue(), ^{
                finish(responseObject);
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失败 : ");
        }];
    });
    
}

-(void) changURL:(NSString*)newURL{
    self.url = newURL;
}

- (void)senduserAccountCheckIfExists:(NSString *)account finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": account};
    [self sendBody:body finishBlock:finish];
}

- (void)senduserAccount:(NSString *)account andPassword:(NSString *)passWord finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": account,
                           @"password": passWord
    };
    [self sendBody:body finishBlock:finish];
}

-(void) senduserNickName:(NSString*)nickName andUserId:(NSString*)userId andPassword:(NSString*)passWord finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"nickName": nickName,
                           @"userId": userId,
                           @"password": passWord
    };
    
    [self sendBody:body finishBlock:finish];
}

- (void)getUserInfoForUserId:(NSString *)userId finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": userId};
    [self sendBody:body finishBlock:finish];
    
}

//- (void)sendFriendId:(NSString *)friendAccount finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
//
//
//
//    NSDictionary* body = @{@"userId": friendAccount};
//
//}



@end

