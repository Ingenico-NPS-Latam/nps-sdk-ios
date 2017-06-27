//
//  RootElement.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "RootParameters.h"

@implementation RootParameters

-(instancetype)init
{
    self = [super init];
    if (self){
        self.pspVersion = @"2.2";
        self.pspMerchantId = @"psp_test";
    }
    return self;
}


-(NSString*) getPspVersionAsXml{
    return [NSString stringWithFormat:@"<psp_Version xsi:type=\"ns2:string\">%@</psp_Version>", self.pspVersion];
}

-(NSString*) getPspMerchantIdAsXml{
    return [NSString stringWithFormat:@"<psp_MerchantId xsi:type=\"ns2:string\">%@</psp_MerchantId>", self.pspMerchantId];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getPspVersionAsXml];
    xml = [xml stringByAppendingString:self.getPspMerchantIdAsXml];
    return xml;
}

-(void) hidrateWithArray:(NSDictionary *)dict{
    //TODO
}

@end
