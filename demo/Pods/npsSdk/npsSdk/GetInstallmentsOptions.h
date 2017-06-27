//
//  GetInstallmentsOptions.h
//  npsSdk
//
//  Created by Gustavo Diaz on 6/7/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Method.h"
#import "RootParameters.h"
#import "CardDetails.h"
#import "Method.h"
#import "Billing.h"
#import "Utilities.h"
#import "GetInstallmentsOptionsResponse.h"


@interface GetInstallmentsOptions : Method

@property RootParameters *root;
@property NSString *pspAmount;
@property NSString *pspProduct;
@property NSString *pspCurrency;
@property NSString *pspCountry;
@property NSString *pspNumPayments;
@property NSString *pspPaymentMethodToken;
@property NSString *pspClientSession;
@property NSString *pspPosDateTime;

-(void) setPspVersion:(NSString*)version;
-(void) setPspMerchantId:(NSString*)merchantId;

-(NSString*) getHeader;
-(NSString*) getFooter;
-(NSString*) getRootAsXml;
-(NSString*) getProductAsXml;
-(NSString*) getCurrencyAsXml;
-(NSString*) getCountryAsXml;
-(NSString*) getNumPaymentsAsXml;
-(NSString*) getPaymentMethodTokenAsXml;
-(NSString*) getClientSessionAsXml;
-(NSString*) getAmountAsXml;


-(NSString*) getPosDateTimeAsXml;

-(GetInstallmentsOptionsResponse*) getResponseObject;


@end
