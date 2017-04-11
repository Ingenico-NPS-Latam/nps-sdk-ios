//
//  GetIINDetailsResponse.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 4/5/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "GetIINDetailsResponse.h"
#import "Utilities.h"


@implementation GetIINDetailsResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"GetIINDetailsResponse";
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [Utilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.merchantId = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    self.product = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    self.responseCod = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.posDateTime = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PosDateTime"];
}


@end
