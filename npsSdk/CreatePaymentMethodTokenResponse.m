//
//  CreatePaymentMethodTokenResponse.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 4/5/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "CreatePaymentMethodTokenResponse.h"
#import "Utilities.h"

@implementation CreatePaymentMethodTokenResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"CreatePaymentMethodTokenResponse";
        self.person = [[Person alloc]init];
        self.cardDetails = [[CardDetails alloc]init];
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [Utilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.alreadyUsed = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_AlreadyUsed"];
    [self.cardDetails hidrateWithResponseDict:self.dictResponse[@"psp_CardOutputDetails"]];
    self.merchantId = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    
    self.paymentMethodToken = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PaymentMethodToken"];
    [self.person hidrateWithResponseDict:self.dictResponse[@"psp_Person"]];
    self.product = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    self.responseCod = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.responseExtended = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
    self.updateAt = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_UpdatedAt"];
}

@end
