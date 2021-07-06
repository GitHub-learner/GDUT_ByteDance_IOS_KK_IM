//
//  MessageModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef MessageModel_h
#define MessageModel_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(long, MessageType){
    TEXT = 0,
    EMOJI = 1 << 0,
    PICTURE = 2 << 0,
};

@interface MessageModel : NSObject

@property (nonatomic, assign) MessageType type;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *sendTime;
@property (nonatomic, copy) NSString *senderId;
@property (nonatomic, copy) NSString *receiverId;

-(instancetype) initWithDict: (NSDictionary* )dict;

@end


#endif /* MessageModel_h */
