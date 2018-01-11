//
//  RecachePaymentMethodToken.h
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethod.h"
#import "NpsRootParameters.h"
#import "NpsPerson.h"
#import "NpsAddress.h"
#import "NpsBilling.h"
#import "NpsRecachePaymentMethodTokenResponse.h"

@interface NpsRecachePaymentMethodToken : NpsMethod

@property NpsRootParameters *root;
@property NSString *pspPaymentMethodId;
@property NSString *pspCardSecurityCode;
@property NpsBilling *billingDetails;
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

-(NpsRecachePaymentMethodTokenResponse*) getResponseObject;

@end
