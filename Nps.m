//
//  NpsSoapClient.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Nps.h"
#import "Methods/Method.h"
#import "Methods/CreatePaymentMethodToken.h"
#import "Methods/RetrievePaymentMethodToken.h"
#import "Methods/RecachePaymentMethodToken.h"
#import "Methods/GetIINDetails.h"
#import "Utils/Utilities.h"

@implementation Nps

-(instancetype)initWithEnvironment:(NSString *)environment{
    self = [super init];
    if (self) {
        self.client = [[NpsSoapClient alloc]initWithConfiguration:[Utilities getEnvironmentConfiguration:@""]];
    }
    return self;
}

-(void)createPaymentMethodToken:(CardDetails *)card
                 billingDetails:(Billing *)billing
                 methodResponse:(void (^)(MethodResponse *))response{
    
    CreatePaymentMethodToken *cppt = [[CreatePaymentMethodToken alloc]init];
    
    [cppt setPspMerchantId:self.merchantId];
    [cppt setPspVersion:self.pspVersion];
    [cppt setPspClientSession:self.clientSession];
    [cppt setPspCardInputDetails:card];
    [cppt setBillingDetails:billing];
    
    [self.client send:cppt methodResponse:response];
}

-(void)retrievePaymentMethodToken:(NSString *)paymentMethodToken
                   methodResponse:(void (^)(MethodResponse *))response{
    
    RetrievePaymentMethodToken *rppt = [[RetrievePaymentMethodToken alloc]init];
    
    [rppt setPspMerchantId:self.merchantId];
    [rppt setPspVersion:self.pspVersion];
    [rppt setPspClientSession:self.clientSession];
    [rppt setPspPaymentMethodToken:paymentMethodToken];
    
    [self.client send:rppt methodResponse:response];
}

-(void)recachePaymentMethodToken:(NSString *)paymentMethodId
                cardSecurityCode:(NSString *)securityCode
                  billingDetails:(Billing *)billing
                  methodResponse:(void (^)(MethodResponse *))response{

    RecachePaymentMethodToken *rppt = [[RecachePaymentMethodToken alloc]init];
    
    [rppt setPspMerchantId:self.merchantId];
    [rppt setPspVersion:self.pspVersion];
    [rppt setPspClientSession:self.clientSession];
    [rppt setPspPaymentMethodId:paymentMethodId];
    [rppt setPspCardSecurityCode:securityCode];
    [rppt setBillingDetails:billing];
    
    [self.client send:rppt methodResponse:response];
}

-(void)getProduct:(NSString *)iin
     postDateTime:(NSString *)pDateTime
   methodResponse:(void (^)(MethodResponse *))response{
    
    GetIINDetails *giid = [[GetIINDetails alloc]init];
    
    [giid setPspMerchantId:self.merchantId];
    [giid setPspVersion:self.pspVersion];
    [giid setPspClientSession:self.clientSession];
    [giid setIin:iin];
    [giid setPosDateTime:pDateTime];
    
    [self.client send:giid methodResponse:response];
}

-(Boolean)validateCardNumber:(NSString *)cardNumber{
    return [Utilities hazCorrectSize:cardNumber max:24 minimum:9];
}

-(Boolean)validateCardHolderName:(NSString *)cardHolderName{
    return [Utilities hazCorrectSize:cardHolderName max:27 minimum:2];
}

-(Boolean)validateCardSecurityCode:(int)cardSecurityCode{
    NSString *cvcAsString = [NSString stringWithFormat:@"%d", cardSecurityCode];
    return [Utilities hazCorrectSize:cvcAsString max:4 minimum:3];
}

-(Boolean)validateCardExpDate:(NSString *)cardNumber{
    return true;
}

@end
