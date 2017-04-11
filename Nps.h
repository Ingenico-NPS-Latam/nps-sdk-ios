//
//  NpsSoapClient.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Method.h"
#import "MethodResponses/MethodResponse.h"
#import "CardDetails.h"
#import "Billing.h"
#import "Soap/NpsSoapClient.h"
//#import "NpsSoapClient.h"
#import "MethodResponses/CreatePaymentMethodTokenResponse.h"
#import "MethodResponses/RetrievePaymentMethodTokenResponse.h"
#import "MethodResponses/RecachePaymentMethodTokenResponse.h"
#import "MethodResponses/GetIINDetailsResponse.h"

@interface Nps : NSObject

-(instancetype) initWithEnvironment:(NSString*) environment;

@property NpsSoapClient* client;
@property NSString* environment;
@property NSString* merchantId;
@property NSString* pspVersion;
@property NSString* clientSession;

-(void)createPaymentMethodToken:(CardDetails*)card
                 billingDetails:(Billing*)billing
                 methodResponse:(void(^)(CreatePaymentMethodTokenResponse *methodResponse))response;

-(void)retrievePaymentMethodToken:(NSString*)paymentMethodToken
                   methodResponse:(void(^)(RetrievePaymentMethodTokenResponse *methodResponse))response;

-(void)recachePaymentMethodToken:(NSString *)paymentMethodId
                cardSecurityCode:(NSString *)securityCode
                  billingDetails:(Billing *)billing
                  methodResponse:(void (^)(RecachePaymentMethodTokenResponse *))response;

-(void)getProduct:(NSString*)iin
     postDateTime:(NSString*)pDateTime
   methodResponse:(void(^)(GetIINDetailsResponse *methodResponse))response;

-(Boolean)validateCardNumber:(NSString*)cardNumber;

-(Boolean)validateCardHolderName:(NSString*)cardNumber;

-(Boolean)validateCardSecurityCode:(int)cardNumber;

-(Boolean)validateCardExpDate:(NSString*)cardNumber;

@end

