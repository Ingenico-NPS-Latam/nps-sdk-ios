//
//  NpsSoapClient.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Nps.h"
#import "Method.h"
#import "CreatePaymentMethodToken.h"
#import "RetrievePaymentMethodToken.h"
#import "RecachePaymentMethodToken.h"
#import "GetIINDetails.h"
#import "GetInstallmentsOptions.h"
#import "Utilities.h"


@implementation Nps

-(instancetype)initWithEnvironment:(int)environment{
    self = [super init];
    if (self) {
        self.client = [[NpsSoapClient alloc]initWithConfiguration:[Utilities getEnvironmentConfiguration:environment]];
        self.pspVersion = @"2.2";
    }
    return self;
}

-(void)createPaymentMethodToken:(CardDetails *)card
                 billingDetails:(Billing *)billing
                 methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{
    
    CreatePaymentMethodToken *cppt = [[CreatePaymentMethodToken alloc]init];
    
    [cppt setPspMerchantId:self.merchantId];
    [cppt setPspClientSession:self.clientSession];
    [cppt setPspCardInputDetails:card];
    [cppt setBillingDetails:billing];
    
    [self.client send:cppt methodResponse:response];
}

-(void)retrievePaymentMethodToken:(NSString *)paymentMethodToken
                   methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{
    
    RetrievePaymentMethodToken *rppt = [[RetrievePaymentMethodToken alloc]init];
    
    [rppt setPspMerchantId:self.merchantId];
    [rppt setPspClientSession:self.clientSession];
    [rppt setPspPaymentMethodToken:paymentMethodToken];
    
    [self.client send:rppt methodResponse:response];
}

-(void)recachePaymentMethodToken:(NSString *)paymentMethodId
                cardSecurityCode:(NSString *)securityCode
                  billingDetails:(Billing *)billing
                  methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{

    RecachePaymentMethodToken *rppt = [[RecachePaymentMethodToken alloc]init];
    
    [rppt setPspMerchantId:self.merchantId];
    [rppt setPspClientSession:self.clientSession];
    [rppt setPspPaymentMethodId:paymentMethodId];
    [rppt setPspCardSecurityCode:securityCode];
    [rppt setBillingDetails:billing];
    
    [self.client send:rppt methodResponse:response];
}

-(void)getIINDetails:(NSString *)iin
   methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{
    
    GetIINDetails *giid = [[GetIINDetails alloc]init];
    
    [giid setPspMerchantId:self.merchantId];
    [giid setPspVersion:self.pspVersion];
    [giid setPspClientSession:self.clientSession];
    [giid setIin:iin];
    [giid setPosDateTime: [Utilities getDate]];
    
    [self.client send:giid methodResponse:response];
}

-(void)getProduct:(NSString *)iin
      methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{
    
    GetIINDetails *giid = [[GetIINDetails alloc]init];
    
    [giid setPspMerchantId:self.merchantId];
    [giid setPspVersion:self.pspVersion];
    [giid setPspClientSession:self.clientSession];
    [giid setIin:iin];
    [giid setPosDateTime:[Utilities getDate]];
    
    [self.client send:giid methodResponse:response];
}

-(void)getInstallmentsOptions:(NSString *)amount
                      product:(NSString *)product
                     currency:(NSString *)currency
                      country:(NSString *)country
                  numPayments:(NSString *)numPayments
           paymentMethodToken:(NSString *)paymentMethodToken
               methodResponse:(void (^)(MethodResponse *methodResponse, NSError *error))response{
    
    GetInstallmentsOptions *gio = [[GetInstallmentsOptions alloc]init];
    
    [gio setPspAmount:amount];
    [gio setPspProduct:product];
    [gio setPspCurrency:currency];
    [gio setPspCountry:country];
    [gio setPspNumPayments:numPayments];
    [gio setPspPaymentMethodToken:paymentMethodToken];
    [gio setPspClientSession:self.clientSession];
    [gio setPspPosDateTime:[Utilities getDate]];
                                  
    [self.client send:gio methodResponse:response];
    
}


-(Boolean)validateCardNumber:(NSString *)cardNumber{
    return [Utilities hazCorrectSize:cardNumber max:24 minimum:9] && [Utilities isValidLuhn:cardNumber];
}

-(Boolean)validateCardHolderName:(NSString *)cardHolderName{
    return [Utilities hazCorrectSize:cardHolderName max:27 minimum:2];
}

-(Boolean)validateCardSecurityCode:(int)cardSecurityCode{
    NSString *cvcAsString = [NSString stringWithFormat:@"%d", cardSecurityCode];
    return [Utilities hazCorrectSize:cvcAsString max:4 minimum:3];
}

-(Boolean)validateCardExpDate:(int)year
                        month:(int)month{
    
    if (month < 1 || month > 12 || year < 1){
        return NO;
    }
    
    year += year < 100 ? 2000 : 0;
    
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:1];
    
    NSDate *expirationDate = [[NSCalendar currentCalendar] dateFromComponents:comp];
    
    return [expirationDate timeIntervalSinceNow] > 0;
}

+(NSString *) getDeviceFingerPrint{
    //return [iovation ioBegin];
    return @"";
}

@end
