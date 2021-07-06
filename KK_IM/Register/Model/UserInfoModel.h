//
//  UserInfoModel.h
//  KK_IM
//
//  Created by Wigginsli on 2021/6/23.
//

#ifndef UserInfoModel_h
#define UserInfoModel_h

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject<NSSecureCoding>

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *deviceToken;
@property (nonatomic, strong) NSMutableArray *friends;

-(instancetype) initWithDict:(NSDictionary* )dict;
@end

#endif /* UserInfoModel_h */
