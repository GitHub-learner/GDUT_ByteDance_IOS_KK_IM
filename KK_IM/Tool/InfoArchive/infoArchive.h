//
//  infoArchive.h
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import <Foundation/Foundation.h>

#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface infoArchive : NSObject

#pragma mark -属性

@property (nonatomic, copy)NSString* filePath;

#pragma mark -方法
-(void) archiveMyInfo:(NSDictionary*)Info ;

-(UserInfoModel*) unarchiveMyInfo;

-(void) setPath:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
