//
//  RecachePaymentMethodToken.h
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Method.h"
#import "RootParameters.h"
#import "Person.h"
#import "Address.h"
#import "Billing.h"
#import "RecachePaymentMethodTokenResponse.h"

@interface RecachePaymentMethodToken : Method

@property RootParameters *root;
@property NSString *pspPaymentMethodId;
@property NSString *pspCardSecurityCode;
@property Billing *billingDetails;
@property NSString *pspClientSession;

-(void) setPspMerchantId:(NSString*)pspMerchantId;

-(NSString*) getHeader;

-(NSString*) getFooter;

-(NSString*) getRootAsXml;

-(NSString*) getPspPaymentMethodIdAsXml;

-(NSString*) getCardSecurityCodeAsXml;

-(NSString*) getPspPersonAsXml;

-(NSString*) getPspAddressAsXml;

-(NSString*) getPspClientSessionAsXml;

-(RecachePaymentMethodTokenResponse*) getResponseObject;

@end
