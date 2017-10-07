//
//  ViewController.m
//  Study-Socket
//
//  Created by 清 貴幸 on 2017/10/06.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "ViewController.h"
#import <GCDAsyncSocket.h>

#define HOST @"www.google.com"
#define PORT 80

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
    BOOL connected = [self.asyncSocket connectToHost:HOST onPort:PORT error:&error];
    if (!connected) {
        NSLog(@"%@", error);
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    
}


- (void)socketDidSecure:(GCDAsyncSocket *)sock
{
    NSString *requestStr = [NSString stringWithFormat:@"GET / HTTP/1.1\r\nHost: %@\r\n\r\n", HOST];
    NSData *requestData = [requestStr dataUsingEncoding:NSUTF8StringEncoding];
    
    [sock writeData:requestData withTimeout:-1 tag:0];
    [sock readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{

}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    
    NSString *httpResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
}


@end
