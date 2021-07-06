//
//  MessageModel.m
//  KK_IM
//
//  Created by Admin on 2021/6/27.
//

#import "MessageModel.h"

@implementation MessageModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
//        self.type = dict[@"type"];
        self.receiverId = dict[@"receiverId"];
        self.senderId = dict[@"senderId"];
        self.content = dict[@"content"];
        self.sendTime = dict[@"updatedAt"];
        NSInteger type = [dict[@"type"] longValue];
        if(type == 0){
            self.type = TEXT;
        }else if (type == 1){
            self.type = EMOJI;
        }else {
            self.type = PICTURE;
        }
    }
    return self;
}

@end
