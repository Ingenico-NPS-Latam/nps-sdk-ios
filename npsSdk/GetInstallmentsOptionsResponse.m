//
//  GetInstallmentsOptionsResponse.m
//  npsSdk
//
//  Created by Ingenico on 6/7/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "GetInstallmentsOptionsResponse.h"

@implementation GetInstallmentsOptionsResponse

-(instancetype)init
{
    self = [super init];
    if (self){
        self._name = @"GetInstallmentsOptionsResponse";
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
    self.responseExtended = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_ResponseExtended"];
    self.amount = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Amount"];
    self.currency = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Currency"];
    self.country = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_Country"];
    self.numPayments = [Utilities getValueFromResponseDictionary:self.dictResponse key:@"psp_NumPayments"];
    self.installments = [self getInstallmentsFromResponse:self.dictResponse[@"psp_InstallmentsOptions"]];    
}

-(NSMutableArray*)getInstallmentsFromResponse:(NSDictionary *)installments{
    NSMutableArray* wrappedInstallments = [[NSMutableArray alloc]init];
    
    if([installments[@"item"] isKindOfClass:[NSArray class]]){
        for (NSDictionary *d in installments[@"item"]){
            Installments *inst = [[Installments alloc]init];
            inst.installmentAmount = [Utilities getValueFromResponseDictionary:d key:@"InstallmentAmount"];
            inst.numPayments = [Utilities getValueFromResponseDictionary:d key:@"NumPayments"];
            inst.interestRate = [Utilities getValueFromResponseDictionary:d key:@"InterestRate"];
            [wrappedInstallments addObject:inst];
        }
    } else {
        Installments *inst = [[Installments alloc]init];
        NSDictionary *d = installments[@"item"];
        inst.installmentAmount = [Utilities getValueFromResponseDictionary:d key:@"InstallmentAmount"];
        inst.numPayments = [Utilities getValueFromResponseDictionary:d key:@"NumPayments"];
        inst.interestRate = [Utilities getValueFromResponseDictionary:d key:@"InterestRate"];
        [wrappedInstallments addObject:inst];
    }
    return wrappedInstallments;
}

@end
