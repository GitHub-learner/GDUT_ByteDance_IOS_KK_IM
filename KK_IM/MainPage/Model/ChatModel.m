//
//  ChatModel.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "ChatModel.h"

@implementation ChatModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
//        self.type = dict[@"type"];
        self.receiverId = dict[@"receiverId"];
        self.senderId = dict[@"senderId"];
        self.lastMessages = dict[@"content"];
        self.unreadCount = [dict[@"unreadCount"] longValue];
        if(dict[@"type"] == 0){
            self.type = PRIVATE;
        }else{
            self.type = PUBLIC;
        }
    }
    return self;
}




@end
