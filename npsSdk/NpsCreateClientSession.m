//
//  CreateClientSession.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsCreateClientSession.h"

#import "NpsRootParameters.h"

@implementation NpsCreateClientSession

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.root = [[NpsRootParameters alloc]init];
    }
    return self;
}


@end
