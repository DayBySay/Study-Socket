//
//  ViewController.m
//  Study-Socket
//
//  Created by 清 貴幸 on 2017/10/06.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "ViewController.h"
#import <GCDAsyncSocket.h>

@interface ViewController () <GCDAsyncSocketDelegate>
@property (nonatomic) GCDAsyncSocket *asyncSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t main = dispatch_get_main_queue();
    self.asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:main];
}


- (IBAction)didTouchUpConnectButton:(id)sender {
    NSError *error = nil;
    BOOL connected = [self.asyncSocket connectToHost:@"www.paypal.com" onPort:443 error:&error];
    if (!connected) {
        NSLog(@"%@", error);
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToUrl:(NSURL *)url {
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    
}

@end
