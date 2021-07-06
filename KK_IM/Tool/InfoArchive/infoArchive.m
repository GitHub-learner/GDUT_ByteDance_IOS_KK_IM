//
//  infoArchive.m
//  KK_IM
//
//  Created by Admin on 2021/6/26.
//

#import "infoArchive.h"




@implementation infoArchive

//归档路径
- (NSString *)filePath{
    _filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"myInfo.data"];
    return _filePath;
}

-(void) archiveMyInfo:(NSDictionary*)Info {
    UserInfoModel* myInfo = [[UserInfoModel alloc]initWithDict:Info];
    //进行归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myInfo requiringSecureCoding:YES error:nil];
    
    [data writeToFile:self.filePath atomically:YES];
}

-(UserInfoModel*) unarchiveMyInfo{
    NSData* undata = [NSData dataWithContentsOfFile:self.filePath];

    UserInfoModel* unarchive = (UserInfoModel*)[NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:undata error:nil];
    return unarchive;
}

- (void)setPath:(NSString *)path{
    self.filePath = path;
}
@end
