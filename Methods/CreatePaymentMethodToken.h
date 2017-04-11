//
//  CreatePaymentMethodToken.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootParameters.h"
#import "CardDetails.h"
#import "Method.h"
#import "Billing.h"
#import "../MethodResponses/CreatePaymentMethodTokenResponse.h"

@interface CreatePaymentMethodToken : Method

@property RootParameters *root;
@property NSString *pspProduct;
@property CardDetails *pspCardInputDetails;
@property Billing *billingDetails;
@property NSString *pspClientSession;


-(void) setPspVersion:(NSString*)version;
-(void) setPspMerchantId:(NSString*)merchantId;

-(NSString*) asXml;
-(NSString*) getHeader;
-(NSString*) getFooter;
-(NSString*) getRootAsXml;
-(NSString*) getPspProductAsXml;
-(NSString*) getPspCardInputDetailsAsXml;
-(NSString*) getPspPersonAsXml;
-(NSString*) getPspAddressAsXml;
-(NSString*) getCientSessionAsXml;
-(CreatePaymentMethodTokenResponse*) getResponseObject;

@end
