//
//  CreateClientSession.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
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
