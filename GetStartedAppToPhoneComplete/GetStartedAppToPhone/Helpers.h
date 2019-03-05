//
//  Helpers.h
//  GetStartedAppToPhone
//
//  Created by Paul Ardeleanu on 04/03/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NexmoClient/NexmoClient.h>

NS_ASSUME_NONNULL_BEGIN

@interface Helpers : NSObject

+ (NSString *)connectionStatusDescription:(NXMConnectionStatus) status;
+ (NSString *)connectionStatusReasonDescription:(NXMConnectionStatusReason) reason;
+ (NSString *)callMemberStatusDescription:(NXMCallMemberStatus) status;

@end

NS_ASSUME_NONNULL_END
