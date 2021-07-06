//
//  UserInfoModel.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "UserInfoModel.h"


@implementation UserInfoModel

-(instancetype) initWithDict:(NSDictionary* )dict{
    if(self = [super init]){
        self.nickName = dict[@"nickName"];
        self.icon = dict[@"icon"];
        self.friends = dict[@"friends"];
        self.deviceToken = dict[@"deviceToken"];
        self.userId = dict[@"userId"];
        self.password = dict[@"password"];
    }
    return self;
}
#pragma mark -归档代理实现,统一使用runtime加载

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.userId forKey:@"userId"];
    [coder encodeObject:self.nickName forKey:@"nickName"];
    [coder encodeObject:self.icon forKey:@"icon"];
    [coder encodeObject:self.friends forKey:@"friends"];
    [coder encodeObject:self.deviceToken forKey:@"deviceToken"];
    [coder encodeObject:self.password forKey:@"password"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if(self = [super init]){
        //解档
        self.userId = [coder decodeObjectForKey:@"userId"];
        self.nickName = [coder decodeObjectForKey:@"nickName"];
        self.icon = [coder decodeObjectForKey:@"icon"];
//        self.friends = [coder decodeObjectForKey:@"friends"];
        self.deviceToken = [coder decodeObjectForKey:@"deviceToken"];
        self.password = [coder decodeObjectForKey:@"password"];
        
        self.friends = [coder decodeObjectForKey:@"friends"][@"friendsId"];
        
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}


@end
