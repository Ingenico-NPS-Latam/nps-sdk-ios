//
//  RecachePaymentMethodTokenResponse.m
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "RecachePaymentMethodTokenResponse.h"
#import "Utilities.h"

@implementation RecachePaymentMethodTokenResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"RecachePaymentMethodTokenResponse";
        self.person = [[Person alloc]init];
        self.cardDetails = [[CardDetails alloc]init];
        self.address = [[Address alloc]init];
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [Utilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.responseCod = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.responseExtended = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
    self.merchantId = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    self.paymentMethodToken = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PaymentMethodToken"];
    self.product = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    [self.cardDetails hidrateWithResponseDict:self.dictResponse[@"psp_CardOutputDetails"]];
    [self.person hidrateWithResponseDict:self.dictResponse[@"psp_Person"]];
    [self.address hidrateWithResponseDict:self.dictResponse[@"psp_Address"]];
    self.alreadyUsed = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_AlreadyUsed"];
    self.createdAt =[Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_CreatedAt"];
    self.updateAt = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_UpdatedAt"];
};
@end
