//
//  RedwhaleMeetingApi.h
//  RedwhaleMeetingApi
//
//  Created by hongtao liu on 2024/2/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 进入会议类型
typedef NS_ENUM(NSUInteger, EntryType) {
    EntryType_Meeting_Creat    = 0,         // 创建会议
    EntryType_Meeting_Join     = 1,         // 加入会议
    EntryType_Call_Start       = 2,         // 发起呼叫
    EntryType_Call_Receive     = 3,         // 收到呼叫
};

/// 通话类型
typedef NS_ENUM(NSUInteger, TelType) {
    TelType_Audio              = 0,         // 语音通话
    TelType_Video              = 1,         // 视频通话
};

/// 通话模式
typedef NS_ENUM(NSUInteger, PersonType) {
    PersonType_Single          = 0,         // 单人通话
    PersonType_Multiple        = 1,         // 多人通话
};

@interface RedwhaleMeetingApi : NSObject

/// 单例
+ (instancetype)sharedInstance;

/**
 * 创建会议 / 加入会议
 *
 * @param viewController       需要弹出视图的控制器
 * @param options              传入参数信息 ： 如果是创建会议/加入会议（userInfo, serverUrl）如果是发起呼叫（userInfo, participant, serverUrl, roomName, type, mode） 如果是收到呼叫（userInfo, serverUrl, roomId, caller, type, mode）
 * @param entryType          进入会议类型（创建会议 / 加入会议）
 *
 */
- (void)startWithController:(UIViewController *)viewController options:(NSDictionary *)options meetingType:(EntryType)entryType;

@end

NS_ASSUME_NONNULL_END
