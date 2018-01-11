//
//  RetrievePaymentMethodToken.h
//  ingeSDK
//
//  Created by Ingenico on 3/28/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethod.h"
#import "NpsRootParameters.h"
#import "NpsRetrievePaymentMethodTokenResponse.h"

@interface NpsRetrievePaymentMethodToken : NpsMethod

@property NpsRootParameters *root;
@property NSString *pspPaymentMethodToken;
@property NSString *pspClientSession;

-(void) setPspMerchantId:(NSString*)pspMerchantId;

-(NSString*) getHeader;

-(NSString*) getFooter;

-(NSString*) getPspPaymentMethodTokenAsXml;

-(NSString*) getPspClientSessionAsXml;

-(NSString*) getRootAsXml;

-(NpsRetrievePaymentMethodTokenResponse*) getResponseObject;

@end
