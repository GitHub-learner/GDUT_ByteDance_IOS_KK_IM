#import "ContactsController.h"
#import <WebKit/WebKit.h>
#import "HistoryTableViewController.h"


@interface ContactsController()<WKUIDelegate,WKNavigationDelegate, UIGestureRecognizerDelegate>


@property (nonatomic, strong) WKWebView * webView;
@property (nonatomic, strong) UITextField* searchBar;
@property BOOL isHidden;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UISwipeGestureRecognizer* upSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer* downSwipe;

@end
@implementation ContactsController


- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    //_webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.size.height-64)];
    
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.bounces = NO;
    _isHidden = NO;
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 20)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //1.网络
    _webView.allowsBackForwardNavigationGestures = YES;
    NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    [self creatSearchBar];
    [self creatGesture];
    [self creatToolBar];


    //2.本地html
    //本地html的地址
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"本地.html" ofType:nil];
    //html 文件中内容
    //NSString *indexContent = [NSString stringWithContentsOfFile: path encoding: NSUTF8StringEncoding error:nil];
    //显示内容
    //[self.webView loadHTMLString: indexContent baseURL: baseUrl];
    
}

- (void) creatSearchBar{
    _searchBar = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 30)];
    _searchBar.borderStyle = UITextBorderStyleRoundedRect;
    UIButton* goBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [goBtn addTarget:self action:@selector(goWeb) forControlEvents:UIControlEventTouchUpInside];
    goBtn.frame = CGRectMake(0, 0, 30, 30);
    [goBtn setTitle:@"🔍" forState:UIControlStateNormal];
    _searchBar.rightView = goBtn;
    _searchBar.rightViewMode = UITextFieldViewModeAlways;
    _searchBar.placeholder = @"请输入网址";
    self.navigationItem.titleView = _searchBar;
}

- (void)goWeb{
    if(_searchBar.text.length > 0){
        NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", _searchBar.text]];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"输入网址不能为空哟" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"🆗" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        return;
    }
}

- (void)creatToolBar{
    self.navigationController.toolbarHidden = NO;
    UIBarButtonItem* itemHistory = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goHistory)];
    UIBarButtonItem* itemBookMarks = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(goBookMarks)];
    UIBarButtonItem* itemBack = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    UIBarButtonItem* itemForward = [[UIBarButtonItem alloc]initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self action:@selector(goForward)];
    self.toolbarItems = @[itemHistory,
                          [self createNilSystemItem:UIBarButtonSystemItemFlexibleSpace],
                          itemBookMarks,
                          [self createNilSystemItem:UIBarButtonSystemItemFlexibleSpace],
                          itemBack,
                          [self createNilSystemItem:UIBarButtonSystemItemFlexibleSpace],
                          itemForward
                    
    ];
    
}


-  (UIBarButtonItem*)createNilSystemItem :(UIBarButtonSystemItem) systemItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:nil action:nil];
}

- (void)goBack{
    if([_webView canGoBack]){
        [_webView goBack];
    }
}

- (void)goForward{
    if([_webView canGoForward]){
        [_webView goForward];
    }
}


# pragma mark - 手势
// 处理手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if (gestureRecognizer == _upSwipe || gestureRecognizer == _downSwipe) {
        return YES;
    }
    return NO;
}




- (void)creatGesture{
    _upSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(upSwipeAction)];
    _upSwipe.delegate = self;
    
    _upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [_webView addGestureRecognizer:_upSwipe];
    
    _downSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(downSwipeAction)];
    _downSwipe.delegate = self;
    
    _downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [_webView addGestureRecognizer:_downSwipe];
}


-(void)upSwipeAction{
    NSLog(@"识别到上滑手势");
    if(_isHidden){
        return;
    }
//    self.navigationItem.titleView = nil;
//    _webView.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40);
//    [UIView animateWithDuration:0.3 animations:^{
//            self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 40);
//            [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:7 forBarMetrics:UIBarMetricsDefault];
//
//        } completion:^(BOOL finished) {
//            self.navigationItem.titleView = _titleLabel;
//        }];
    [self.navigationController setToolbarHidden:YES animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    _isHidden = YES;
    
}

- (void)downSwipeAction{
    
    NSLog(@"%f",_webView.scrollView.contentOffset.y);
    if (!_isHidden) {
        return;
    }
    NSLog(@"识别到下滑手势");
//    self.navigationItem.titleView = nil;
//
//    [UIView animateWithDuration:0.3 animations:^{
//            self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 64);
//            [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
//
//        } completion:^(BOOL finished) {
//            self.navigationItem.titleView = _searchBar;
//        }];
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self.navigationController  setNavigationBarHidden:NO animated:YES];
    _isHidden = NO;
}

- (void) goHistory{
    HistoryTableViewController * controller = [HistoryTableViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) loadURL:(NSString *)urlString{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}



- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //_titleLabel.text = webView.URL.absoluteString;
    _titleLabel.text = webView.title;
    NSArray *array = [[NSUserDefaults standardUserDefaults]valueForKey:@"History"];
    if (!array) {
        array = [NSArray new];
    }
    NSMutableArray* newArray = [[NSMutableArray alloc]initWithArray:array];
    [newArray addObject:_titleLabel.text];
    [[NSUserDefaults standardUserDefaults]setValue:newArray forKey:@"History"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}

@end

