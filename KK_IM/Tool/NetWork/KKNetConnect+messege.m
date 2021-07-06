//
//  KKNetConnect+messege.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "KKNetConnect+messege.h"

@implementation KKNetConnect (messege)

- (void)getMessegeList:(NSString *)userId finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": userId};
    
    [self sendBody:body finishBlock:finish];
}

-(void) getMessegeDetailList:(NSString*)userId withFriendId:(NSString*)friendId finishBlock:(void (^)(NSDictionary * _Nonnull))finish{
    NSDictionary* body = @{@"userId": userId, @"friendId": friendId};
    
    [self sendBody:body finishBlock:finish];
}
@end
