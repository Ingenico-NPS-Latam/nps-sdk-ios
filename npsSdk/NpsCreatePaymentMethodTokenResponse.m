//
//  CreatePaymentMethodTokenResponse.m
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsCreatePaymentMethodTokenResponse.h"
#import "NpsUtilities.h"

@implementation NpsCreatePaymentMethodTokenResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"CreatePaymentMethodTokenResponse";
        self.person = [[NpsPerson alloc]init];
        self.cardDetails = [[NpsCardDetails alloc]init];
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [NpsUtilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.alreadyUsed = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_AlreadyUsed"];
    [self.cardDetails hidrateWithResponseDict:self.dictResponse[@"psp_CardOutputDetails"]];
    self.merchantId = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    
    self.paymentMethodToken = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PaymentMethodToken"];
    [self.person hidrateWithResponseDict:self.dictResponse[@"psp_Person"]];
    self.product = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    self.responseCod = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.responseExtended = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
    self.updateAt = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_UpdatedAt"];
}

@end
