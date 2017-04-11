//
//  RetrievePaymentMethodToken.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/28/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Method.h"
#import "RootParameters.h"
#import "../MethodResponses/RetrievePaymentMethodTokenResponse.h"

@interface RetrievePaymentMethodToken : Method

@property RootParameters *root;
@property NSString *pspPaymentMethodToken;
@property NSString *pspClientSession;

-(void) setPspVersion:(NSString*)pspVersion;
-(void) setPspMerchantId:(NSString*)pspMerchantId;

-(NSString*) getHeader;

-(NSString*) getFooter;

-(NSString*) getPspPaymentMethodTokenAsXml;

-(NSString*) getPspClientSessionAsXml;

-(NSString*) getRootAsXml;

-(RetrievePaymentMethodTokenResponse*) getResponseObject;

@end
