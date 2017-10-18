//
//  RetrievePaymentMethodToken.h
//  ingeSDK
//
//  Created by Ingenico on 3/28/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Method.h"
#import "RootParameters.h"
#import "RetrievePaymentMethodTokenResponse.h"

@interface RetrievePaymentMethodToken : Method

@property RootParameters *root;
@property NSString *pspPaymentMethodToken;
@property NSString *pspClientSession;

-(void) setPspMerchantId:(NSString*)pspMerchantId;

-(NSString*) getHeader;

-(NSString*) getFooter;

-(NSString*) getPspPaymentMethodTokenAsXml;

-(NSString*) getPspClientSessionAsXml;

-(NSString*) getRootAsXml;

-(RetrievePaymentMethodTokenResponse*) getResponseObject;

@end
