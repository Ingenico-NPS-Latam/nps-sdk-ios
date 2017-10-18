//
//  CreateClientSession.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "CreateClientSession.h"

#import "RootParameters.h"

@implementation CreateClientSession

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.root = [[RootParameters alloc]init];
    }
    return self;
}


@end
