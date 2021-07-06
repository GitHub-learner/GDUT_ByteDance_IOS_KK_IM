
#import <UIKit/UIKit.h>

typedef void(^TakeOperationSureBlock)(id item, NSString *filePath);

@interface KVideoViewController : UIViewController

@property (copy, nonatomic) TakeOperationSureBlock takeBlock;
// 视频最大时长
@property (assign, nonatomic) CGFloat maxDuration;

@end
