//
//  KKNetConnect+messege.h
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "KKNetConnect.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKNetConnect (messege)

//获取消息列表
-(void) getMessegeList:(NSString*)userId finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

-(void) getMessegeDetailList:(NSString*)userId withFriendId:(NSString*)friendId finishBlock:(void (^)(NSDictionary * _Nonnull))finish;

@end

NS_ASSUME_NONNULL_END
