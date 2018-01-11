//
//  RecachePaymentMethodTokenResponse.m
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsRecachePaymentMethodTokenResponse.h"
#import "NpsUtilities.h"

@implementation NpsRecachePaymentMethodTokenResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"RecachePaymentMethodTokenResponse";
        self.person = [[NpsPerson alloc]init];
        self.cardDetails = [[NpsCardDetails alloc]init];
        self.address = [[NpsAddress alloc]init];
    }
    return self;
}

-(void) setResponse:(NSDictionary *)response{
    self.dictResponse = [NpsUtilities removeTrashFromResponse:response responseKey:self._name];
    [self hidrate];
}

-(void) hidrate{
    self.responseCod = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseCod"];
    self.responseMsg = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseMsg"];
    self.responseExtended = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
    self.merchantId = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_MerchantId"];
    self.paymentMethodToken = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_PaymentMethodToken"];
    self.product = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Product"];
    [self.cardDetails hidrateWithResponseDict:self.dictResponse[@"psp_CardOutputDetails"]];
    [self.person hidrateWithResponseDict:self.dictResponse[@"psp_Person"]];
    [self.address hidrateWithResponseDict:self.dictResponse[@"psp_Address"]];
    self.alreadyUsed = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_AlreadyUsed"];
    self.createdAt =[NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_CreatedAt"];
    self.updateAt = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_UpdatedAt"];
};
@end
