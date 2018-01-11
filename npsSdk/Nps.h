//
//  NpsSoapClient.h
//  ingeSDK
//
//  Created by Ingenico on 3/21/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iovation.h"
#import "NpsMethod.h"
#import "NpsMethodResponse.h"
#import "NpsCardDetails.h"
#import "NpsBilling.h"
#import "NpsSoapClient.h"
#import "NpsCreatePaymentMethodTokenResponse.h"
#import "NpsRetrievePaymentMethodTokenResponse.h"
#import "NpsRecachePaymentMethodTokenResponse.h"
#import "NpsGetInstallmentsOptionsResponse.h"
#import "NpsGetIINDetailsResponse.h"
#import "NpsGetProductResponse.h"
#import "NpsEnvironments.h"

@interface Nps : NSObject

-(instancetype) initWithEnvironment:(int) environment;

@property NpsSoapClient* client;
@property NSString* environment;
@property NSString* merchantId;
@property NSString* pspVersion;
@property NSString* clientSession;

-(void)createPaymentMethodToken:(NpsCardDetails*)card
                 billingDetails:(NpsBilling*)billing
                 methodResponse:(void (^)(NpsCreatePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)retrievePaymentMethodToken:(NSString*)paymentMethodToken
                   methodResponse:(void(^)(NpsRetrievePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)recachePaymentMethodToken:(NSString *)paymentMethodId
                cardSecurityCode:(NSString *)securityCode
                  billingDetails:(NpsBilling *)billing
                  methodResponse:(void (^)(NpsRecachePaymentMethodTokenResponse *methodResponse, NSError *error))response;

-(void)getIINDetails:(NSString*)iin
   methodResponse:(void(^)(NpsGetIINDetailsResponse *methodResponse, NSError *error))response;

-(void)getProduct:(NSString*)iin
      methodResponse:(void(^)(NpsGetProductResponse *methodResponse, NSError *error))response;

-(void)getInstallmentsOptions:(NSString*)amount
                      product:(NSString*)product
                     currency:(NSString*)currency
                      country:(NSString*)country
                  numPayments:(NSString*)numPayments
           paymentMethodToken:(NSString*)paymentMethodToken
               methodResponse:(void(^)(NpsGetInstallmentsOptionsResponse *methodResponse, NSError *error))response;

-(Boolean)validateCardNumber:(NSString*)cardNumber;

-(Boolean)validateCardHolderName:(NSString*)holderName;

-(Boolean)validateCardSecurityCode:(int)cvv;

-(Boolean)validateCardExpDate:(int)year
                         month:(int)month;

+(NSString *)getDeviceFingerPrint;

@end

