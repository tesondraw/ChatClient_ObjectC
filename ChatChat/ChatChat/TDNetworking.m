//
//  TDNetworking.m
//  UDPClient
//
//  Created by Teson on 2018/7/2.
//  Copyright © 2018年 caokun. All rights reserved.
//

#import "TDNetworking.h"

#include <ifaddrs.h>
#include <arpa/inet.h>


@implementation TDNetworking

+ (NSString *)localIPAddressString {
    NSString *address  = nil;//= @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);

    return address;
}

+ (uint32_t)localIPAddressInt {
    uint32_t ip = 0;

    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;

    success = getifaddrs(&interfaces);

    if (success == 0) { // 0 表示获取成功

        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {

                    struct in_addr addr;
                    if (inet_aton(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr), &addr) != 0) {
                        ip = ntohl(addr.s_addr);
//                        NSLog(@"%08x", ip);
//                        NSLog(@"xxxxxx:%u", ip);
                    } else {
                        NSLog(@"invalid address");
                    }
                }
            }

            temp_addr = temp_addr->ifa_next;
        }
    }

    freeifaddrs(interfaces);

    return ip;
}

@end
