//
//  ChatViewController.m
//  KK_IM
//
//  Created by Admin on 2021/6/27.
//

#import "ChatViewController.h"

#import "MessageModel.h"

#import "KKNetConnect+messege.h"
#import "infoArchive.h"

@interface ChatViewController () <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *messageTableView;
@property (strong, nonatomic) NSMutableArray* messageList;

@end

@implementation ChatViewController

// 懒加载
- (NSMutableArray *) messageList {
    if (!_messageList) {
        _messageList = [NSMutableArray array];
    }
    return _messageList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageTableView.dataSource = self;
    NSLog(@"和%@的聊天界面", self.oppositeUserId);
    
    [self reloadHistory];
    // 定义一个定时器，约定多少时间循环调用self的run方法
    NSTimer *timer = [NSTimer timerWithTimeInterval:30.0 target:self selector:@selector(reloadHistory) userInfo:nil repeats:YES];

    // 将定时器添加到当前RunLoop的NSDefaultRunLoopMode下
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}

#pragma mark -加载历史信息
-(void) reloadHistory{
    KKNetConnect* conn = [[KKNetConnect alloc]initWithUrl:@"https://qcxr62.fn.thelarkcloud.com/getMessageInfo"];
    
    infoArchive* unarchiver = [[infoArchive alloc]init];
    UserInfoModel* myInfo = [unarchiver unarchiveMyInfo];
    
    NSLog(@"刷新聊天窗口列表");
    [self.messageList removeAllObjects];
    [conn getMessegeDetailList:myInfo.userId withFriendId:self.oppositeUserId finishBlock:^(NSDictionary * _Nonnull dict) {
        
//        NSLog(@"%@",dict[@"resultList"]);
        
        NSArray* tempArr = dict[@"resultList"];
        
        for (NSDictionary* d in tempArr) {
            MessageModel* messagemodel = [[MessageModel alloc]initWithDict: d];
            
            [self.messageList addObject:messagemodel];
        }
        //刷新界面
        [self.messageTableView reloadData];
    }];
}

// 每个cell的内容
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {    
    static NSString* leftCellId = @"LeftMessageCell";
    static NSString* rightCellId = @"RightMessageCell";
    
    
    // 从缓存池中找,判断这条消息是对方发的还是自己发的,用两种样式
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    if ([[self.messageList[indexPath.row] senderId] isEqualToString:self.oppositeUserId]) {
        cell = [tableView dequeueReusableCellWithIdentifier: leftCellId];
        cell.textLabel.text = [NSString stringWithFormat:@"昵称[%@]", self.oppositeUserId];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier: rightCellId];
        cell.textLabel.text = @"我";
    }
    
    cell.detailTextLabel.text = [self.messageList[indexPath.row] content];
    
    return cell;
}

// 单组table有多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageList.count;
}

@end
