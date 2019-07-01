//
//  ViewController.m
//  GetStartedAppToPhone
//
//  Created by Paul Ardeleanu on 28/02/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

#import "ViewController.h"
#import <NexmoClient/NexmoClient.h>
#import "IAVAppDefine.h"
#import "Helpers.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;

@property NXMConnectionStatus connectionStatus;
@property NXMCallMemberStatus callStatus;

@property NXMClient *nexmoClient;
@property NXMCall *ongoingCall;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.connectionStatus = NXMConnectionStatusDisconnected;
    self.callStatus = NXMCallMemberStatusCompleted;
    self.statusLabel.text = @"Ready";
    [self.loadingIndicator startAnimating];
    [self updateInterface];
    [self setupNexmoClient];
}

- (void)updateInterface {
    if(![NSThread isMainThread]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateInterface];
        });
        return;
    }
    switch (self.connectionStatus) {
        case NXMConnectionStatusDisconnected:
            self.callButton.alpha = 0;
            self.statusLabel.text = @"Not connected";
            self.statusLabel.alpha = 1;
            [self.loadingIndicator stopAnimating];
            break;
        case NXMConnectionStatusConnecting:
            self.callButton.alpha = 0;
            self.statusLabel.text = @"Connecting...";
            self.statusLabel.alpha = 1;
            [self.loadingIndicator startAnimating];
            break;
        case NXMConnectionStatusConnected:
            self.callButton.alpha = 1;
            self.statusLabel.text = @"Connected";
            self.statusLabel.alpha = 1;
            [self.loadingIndicator stopAnimating];
            [self.callButton setTitle:@"Call" forState:UIControlStateNormal];
            self.callButton.titleLabel.text = @"Call";
            self.callButton.alpha = 1;
            if (self.ongoingCall) {
                switch (self.callStatus) {
                    case NXMCallMemberStatusCancelled:
                        self.statusLabel.text = @"Call Cancelled";
                        break;
                    case NXMCallMemberStatusCompleted:
                        self.statusLabel.text = @"Call Completed";
                        break;
                    case NXMCallMemberStatusDialling:
                        self.statusLabel.text = @"Dialing...";
                        [self.loadingIndicator startAnimating];
                        self.callButton.alpha = 0;
                        break;
                    case NXMCallMemberStatusCalling:
                        self.statusLabel.text = @"Calling...";
                        [self.loadingIndicator startAnimating];
                        self.callButton.alpha = 0;
                        break;
                    case NXMCallMemberStatusStarted:
                        self.statusLabel.text = @"Call Started";
                        [self.callButton setTitle:@"End Call" forState:UIControlStateNormal];
                        break;
                    case NXMCallMemberStatusAnswered:
                        self.statusLabel.text = @"Answered";
                        [self.callButton setTitle:@"End Call" forState:UIControlStateNormal];
                        break;
                }
            }
            break;
        default:
            break;
    }
    
}


#pragma mark - Tutorial Methods
#pragma mark Setup
- (void)setupNexmoClient {

}

#pragma mark Call
- (IBAction)callNumber:(id)sender {
    
}


#pragma mark NXMClientDelegate


#pragma mark NXMCallDelegate

@end
