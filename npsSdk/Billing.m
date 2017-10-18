//
//  Billing.m
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Billing.h"

@implementation Billing

-(instancetype)init
{
    self = [super init];
    if (self){
        self.pspPerson = [[Person alloc]init];
        self.pspAddress = [[Address alloc]init];
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
