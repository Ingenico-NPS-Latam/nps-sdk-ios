//
//  GetIINDetailsResponse.m
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsGetIINDetailsResponse.h"
#import "NpsUtilities.h"


@implementation NpsGetIINDetailsResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"GetIINDetailsResponse";
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [NpsUtilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.merchantId = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    self.product = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    self.responseCod = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.posDateTime = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PosDateTime"];
    self.responseExtended = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
}


@end
