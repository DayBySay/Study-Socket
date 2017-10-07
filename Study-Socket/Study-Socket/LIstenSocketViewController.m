//
//  LIstenSocketViewController.m
//  Study-Socket
//
//  Created by 清 貴幸 on 2017/10/07.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "LIstenSocketViewController.h"
#import <GCDAsyncSocket.h>

@interface LIstenSocketViewController () <GCDAsyncSocketDelegate>
@property (nonatomic) GCDAsyncSocket *listenSocket;
@property (nonatomic) GCDAsyncSocket *fromSocket;
@property (nonatomic) GCDAsyncSocket *toSocket;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation LIstenSocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error = nil;
    self.listenSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self.listenSocket acceptOnPort:10080 error:&error];
    
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    [self appendLog:NSStringFromSelector(_cmd)];
    NSLog(@"Accept:%p",sock);
    [self appendLog:[NSString stringWithFormat:@"Accept:%p",sock]];
    
    NSError *error = nil;
    GCDAsyncSocket *toSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    if (![toSocket connectToHost:@"www.google.com" onPort:80 error:&error]) {
        NSLog(@"error: %@", error);
    } else {
        self.fromSocket = newSocket;
        self.toSocket = toSocket;
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    [self appendLog:NSStringFromSelector(_cmd)];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    [self appendLog:NSStringFromSelector(_cmd)];
}

- (void)appendLog:(NSString *)log {
    NSString *current = self.textView.text;
    NSString *appended = [NSString stringWithFormat:@"🍜 %@\n%@", log, current];
    self.textView.text = appended;
}


@end
