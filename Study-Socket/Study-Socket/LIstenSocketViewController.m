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
@end

@implementation LIstenSocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error = nil;
    self.listenSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self.listenSocket acceptOnPort:10080 error:&error];
    
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    NSLog(@"Accept:%p",sock);
}

@end
