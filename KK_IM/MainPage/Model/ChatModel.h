//
//  ChatModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef ChatModel_h
#define ChatModel_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(long, ChatType){
    PRIVATE = 0,
    PUBLIC = 1 << 0
};

@interface ChatModel : NSObject

@property (nonatomic, assign) ChatType type;
@property (nonatomic, copy) NSString *senderId;
@property (nonatomic, copy) NSString *receiverId;
@property (nonatomic, copy) NSString *lastMessages;
@property (nonatomic, assign) NSInteger unreadCount;

#pragma mark -方法
-(instancetype) initWithDict:(NSDictionary* )dict;
@end

#endif /* ChatModel_h */
