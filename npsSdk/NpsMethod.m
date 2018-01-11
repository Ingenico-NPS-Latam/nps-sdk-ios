//
//  Method.m
//  ingeSDK
//
//  Created by Ingenico on 3/21/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethod.h"

@implementation NpsMethod

-(instancetype)init
{
    self = [super init];
    if (self){
        self.superFooter = @"</ns1:Body></SOAP-ENV:Envelope>";
        self.superHeader = @"<SOAP-ENV:Envelope><SOAP-ENV:Header/><ns1:Body>";
        self.name = @"";
    }
    return self;
}

-(NpsMethodResponse*) getResponseObject{
    return [[NpsMethodResponse alloc]init];
}

@end
