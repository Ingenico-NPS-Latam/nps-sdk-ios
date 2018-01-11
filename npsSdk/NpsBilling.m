//
//  Billing.m
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsBilling.h"

@implementation NpsBilling

-(instancetype)init
{
    self = [super init];
    if (self){
        self.pspPerson = [[NpsPerson alloc]init];
        self.pspAddress = [[NpsAddress alloc]init];
    }
    return self;
}

-(NSString*) getPspAddressAsXml{
    return [self.pspAddress asXml];
}

-(NSString*) getPspPersonAsXml{
    return [self.pspPerson asXml];
}

@end
