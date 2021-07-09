//
//  RegisterModel.h
//  KK_IM
//
//  Created by Admin on 2021/7/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterModel : NSObject

@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *password;

@end

NS_ASSUME_NONNULL_END
