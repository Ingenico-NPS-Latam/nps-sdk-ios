//
//  GetInstallmentsOptionsResponse.m
//  npsSdk
//
//  Created by Ingenico on 6/7/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsGetInstallmentsOptionsResponse.h"

@implementation NpsGetInstallmentsOptionsResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"GetInstallmentsOptionsResponse";
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
    self.amount = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Amount"];
    self.currency = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Currency"];
    self.country = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Country"];
    self.numPayments = [NpsUtilities getValueFromResponseDictionary:self.dictResponse key:@"psp_NumPayments"];
    self.installments = [self getInstallmentsFromResponse:self.dictResponse[@"psp_InstallmentsOptions"]];    
}

-(NSMutableArray*)getInstallmentsFromResponse:(NSDictionary *)installments{
    NSMutableArray* wrappedInstallments = [[NSMutableArray alloc]init];
    
    if([installments[@"item"] isKindOfClass:[NSArray class]]){
        for (NSDictionary *d in installments[@"item"]){
            NpsInstallments *inst = [[NpsInstallments alloc]init];
            inst.installmentAmount = [NpsUtilities getValueFromResponseDictionary:d key:@"InstallmentAmount"];
            inst.numPayments = [NpsUtilities getValueFromResponseDictionary:d key:@"NumPayments"];
            inst.interestRate = [NpsUtilities getValueFromResponseDictionary:d key:@"InterestRate"];
            [wrappedInstallments addObject:inst];
        }
    } else {
        NpsInstallments *inst = [[NpsInstallments alloc]init];
        NSDictionary *d = installments[@"item"];
        inst.installmentAmount = [NpsUtilities getValueFromResponseDictionary:d key:@"InstallmentAmount"];
        inst.numPayments = [NpsUtilities getValueFromResponseDictionary:d key:@"NumPayments"];
        inst.interestRate = [NpsUtilities getValueFromResponseDictionary:d key:@"InterestRate"];
        [wrappedInstallments addObject:inst];
    }
    return wrappedInstallments;
}

@end
