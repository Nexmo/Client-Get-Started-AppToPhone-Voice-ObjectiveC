//
//  Helpers.m
//  GetStartedAppToPhone
//
//  Created by Paul Ardeleanu on 04/03/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers


+ (NSString *)connectionStatusDescription:(NXMConnectionStatus) status {
    switch (status) {
        case NXMConnectionStatusDisconnected:
            return @"Disconnected";
            break;
        case NXMConnectionStatusConnecting:
            return @"Connecting";
            break;
        case NXMConnectionStatusConnected:
            return @"Connected";
            break;
    }
}
+ (NSString *)connectionStatusReasonDescription:(NXMConnectionStatusReason) reason {
    switch (reason) {
        case NXMConnectionStatusReasonUnknown:
            return @"Unknown";
            break;
        case NXMConnectionStatusReasonLogin:
            return @"Login";
            break;
        case NXMConnectionStatusReasonLogout:
            return @"Logout";
            break;
        case NXMConnectionStatusReasonTokenRefreshed:
            return @"Refreshed";
            break;
        case NXMConnectionStatusReasonTokenInvalid:
            return @"Invalid";
            break;
        case NXMConnectionStatusReasonTokenExpired:
            return @"Expired";
            break;
        case NXMConnectionStatusReasonTerminated:
            return @"Terminated";
            break;
    }
}
+ (NSString *)callMemberStatusDescription:(NXMCallMemberStatus) status {
    switch (status) {
        case NXMCallMemberStatusDialling:
            return @"Dialling";
            break;
        case NXMCallMemberStatusCalling:
            return @"Calling";
            break;
        case NXMCallMemberStatusStarted:
            return @"Started";
            break;
        case NXMCallMemberStatusAnswered:
            return @"Answered";
            break;
        case NXMCallMemberStatusCancelled:
            return @"Cancelled";
            break;
        case NXMCallMemberStatusCompleted:
            return @"Completed";
            break;
    }
    
}

@end
