//
//  ViewController.m
//  Redwhale
//
//  Created by hongtao liu on 2024/2/5.
//

#import "ViewController.h"
#import "RedwhaleMeetingApi.h"
#import "Masonry.h"

@interface ViewController ()

/// logo
@property(nonatomic, strong) UIImageView *logoImageView;

/// 发起会议按钮
@property(nonatomic, strong) UIButton *creatMeetingButton;

/// 加入会议按钮
@property(nonatomic, strong) UIButton *joinMeetingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available(iOS 13.0, *)) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    } else {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


/// 初始化UI
- (void)setUpUI {
    [self setNeedsStatusBarAppearanceUpdate];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.creatMeetingButton];
    [self.view addSubview:self.joinMeetingButton];
    
    __weak typeof(self) weakSelf = self;
    [self.joinMeetingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(34);
        make.right.equalTo(weakSelf.view.mas_right).offset(-34);
        make.height.mas_equalTo(49);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-71);
    }];
    [self.creatMeetingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(34);
        make.right.equalTo(weakSelf.view.mas_right).offset(-34);
        make.height.mas_equalTo(49);
        make.bottom.equalTo(weakSelf.joinMeetingButton.mas_top).offset(-20);
    }];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.mas_centerX).offset(0);
        make.width.height.mas_equalTo(244);
        make.top.lessThanOrEqualTo(weakSelf.view.mas_top).offset(94);
        make.bottom.lessThanOrEqualTo(weakSelf.joinMeetingButton.mas_top).offset(-50);
    }];
}

/// 点击了创建会议按钮
- (void)clickCreatMeetingBtn {
    NSLog(@"【点击了创建会议按钮】");
    NSDictionary *userDic = @{@"userId" : [NSString stringWithFormat:@"%ld", [self generateRandomNumberWithDigits:6]],
                              @"userName" : [NSString stringWithFormat:@"demo-user%ld", [self generateRandomNumberWithDigits:3]],
                              @"avatar" : @""
    };
    [[RedwhaleMeetingApi sharedInstance] startWithController:self options:@{
        @"userInfo" : userDic,
        @"serverUrl" : @"https://demo.redwhalertc.com/"
    } meetingType:EntryType_Meeting_Creat];
}

/// 点击了加入会议按钮
- (void)clickJoinMeetingBtn {
    NSLog(@"【点击了加入会议按钮】");
    NSDictionary *userDic = @{@"userId" : [NSString stringWithFormat:@"%ld", [self generateRandomNumberWithDigits:6]],
                              @"userName" : [NSString stringWithFormat:@"demo-user%ld", [self generateRandomNumberWithDigits:3]],
                              @"avatar" : @""
    };
    [[RedwhaleMeetingApi sharedInstance] startWithController:self options:@{
        @"userInfo" : userDic,
        @"serverUrl" : @"https://demo.redwhalertc.com/"
    } meetingType:EntryType_Meeting_Join];
}

/// 生成随机数
- (NSInteger)generateRandomNumberWithDigits:(NSInteger)numDigits {
    NSInteger minRange = pow(10, numDigits - 1);
    NSInteger maxRange = pow(10, numDigits) - 1;
    return arc4random_uniform((uint32_t)(maxRange - minRange + 1)) + minRange;
}

#pragma mark - getter
- (UIButton *)creatMeetingButton {
    if (!_creatMeetingButton) {
        _creatMeetingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_creatMeetingButton setBackgroundColor:[UIColor colorWithRed:28 / 255.0 green:102 / 255.0 blue:229 / 255.0 alpha:1]];
        [_creatMeetingButton setTitle:@"新建房间" forState:UIControlStateNormal];
        [_creatMeetingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_creatMeetingButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_creatMeetingButton addTarget:self action:@selector(clickCreatMeetingBtn) forControlEvents:UIControlEventTouchUpInside];
        [_creatMeetingButton setImage:[UIImage imageNamed:@"my_video_creat_meeting_phone"] forState:UIControlStateNormal];
        _creatMeetingButton.clipsToBounds = YES;
        _creatMeetingButton.layer.cornerRadius = 4;
        _creatMeetingButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        _creatMeetingButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return _creatMeetingButton;
}

- (UIButton *)joinMeetingButton {
    if (!_joinMeetingButton) {
        _joinMeetingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _joinMeetingButton.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:102 / 255.0 blue:229 / 255.0 alpha:1];
        [_joinMeetingButton setTitle:@"进入房间" forState:UIControlStateNormal];
        [_joinMeetingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_joinMeetingButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_joinMeetingButton addTarget:self action:@selector(clickJoinMeetingBtn) forControlEvents:UIControlEventTouchUpInside];
        [_joinMeetingButton setImage:[UIImage imageNamed:@"my_video_join_meeting_phone"] forState:UIControlStateNormal];
        _joinMeetingButton.clipsToBounds = YES;
        _joinMeetingButton.layer.cornerRadius = 4;
        _joinMeetingButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        _joinMeetingButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return _joinMeetingButton;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_video_logo_phone"]];
    }
    return _logoImageView;
}

@end
