//
//  CreatePaymentMethodToken.h
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NpsRootParameters.h"
#import "NpsCardDetails.h"
#import "NpsMethod.h"
#import "NpsBilling.h"
#import "NpsCreatePaymentMethodTokenResponse.h"

@interface NpsCreatePaymentMethodToken : NpsMethod

@property NpsRootParameters *root;
@property NpsCardDetails *pspCardInputDetails;
@property NpsBilling *billingDetails;
@property NSString *pspClientSession;


-(void) setPspMerchantId:(NSString*)merchantId;

-(NSString*) asXml;
-(NSString*) getHeader;
-(NSString*) getFooter;
-(NSString*) getRootAsXml;
-(NSString*) getPspCardInputDetailsAsXml;
-(NSString*) getPspPersonAsXml;
-(NSString*) getPspAddressAsXml;
-(NSString*) getCientSessionAsXml;
-(NpsCreatePaymentMethodTokenResponse*) getResponseObject;

@end
