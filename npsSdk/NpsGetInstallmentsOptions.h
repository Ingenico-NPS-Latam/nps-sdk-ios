//
//  GetInstallmentsOptions.h
//  npsSdk
//
//  Created by Ingenico on 6/7/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethod.h"
#import "NpsRootParameters.h"
#import "NpsCardDetails.h"
#import "NpsMethod.h"
#import "NpsBilling.h"
#import "NpsUtilities.h"
#import "NpsGetInstallmentsOptionsResponse.h"


@interface NpsGetInstallmentsOptions : NpsMethod

@property NpsRootParameters *root;
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

-(NpsGetInstallmentsOptionsResponse*) getResponseObject;


@end
