//
//  NpsSoapClient.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <iovation/iovation.h>
#import "Method.h"
#import "MethodResponse.h"
#import "CardDetails.h"
#import "Billing.h"
#import "NpsSoapClient.h"
#import "CreatePaymentMethodTokenResponse.h"
#import "RetrievePaymentMethodTokenResponse.h"
#import "RecachePaymentMethodTokenResponse.h"
#import "GetInstallmentsOptionsResponse.h"
#import "GetIINDetailsResponse.h"
#import "GetProductResponse.h"
#import "Environments.h"

@interface Nps : NSObject

-(instancetype) initWithEnvironment:(int) environment;

@property NpsSoapClient* client;
@property NSString* environment;
@property NSString* merchantId;
@property NSString* pspVersion;
@property NSString* clientSession;

-(void)createPaymentMethodToken:(CardDetails*)card
                 billingDetails:(Billing*)billing
                 methodResponse:(void (^)(CreatePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)retrievePaymentMethodToken:(NSString*)paymentMethodToken
                   methodResponse:(void(^)(RetrievePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)recachePaymentMethodToken:(NSString *)paymentMethodId
                cardSecurityCode:(NSString *)securityCode
                  billingDetails:(Billing *)billing
                  methodResponse:(void (^)(RecachePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)getIINDetails:(NSString*)iin
   methodResponse:(void(^)(GetIINDetailsResponse *methodResponse, NSError *error))response;

-(void)getProduct:(NSString*)iin
      methodResponse:(void(^)(GetProductResponse *methodResponse, NSError *error))response;

-(void)getInstallmentsOptions:(NSString*)amount
                      product:(NSString*)product
                     currency:(NSString*)currency
                      country:(NSString*)country
                  numPayments:(NSString*)numPayments
           paymentMethodToken:(NSString*)paymentMethodToken
               methodResponse:(void(^)(GetInstallmentsOptionsResponse *methodResponse, NSError *error))response;

-(Boolean)validateCardNumber:(NSString*)cardNumber;

-(Boolean)validateCardHolderName:(NSString*)holderName;

-(Boolean)validateCardSecurityCode:(int)cvv;

-(Boolean)validateCardExpDate:(int)year
                         month:(int)month;

+(NSString *)getDeviceFingerPrint;

@end

