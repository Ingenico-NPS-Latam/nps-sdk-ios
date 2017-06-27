//
//  Method.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Method.h"

@implementation Method

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

-(MethodResponse*) getResponseObject{
    return [[MethodResponse alloc]init];
}

@end
