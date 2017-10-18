//
//  GetIINDetails.h
//  ingeSDK
//
//  Created by Ingenico on 3/30/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Method.h"
#import "RootParameters.h"
#import "GetIINDetailsResponse.h"

@interface GetIINDetails : Method

@property RootParameters *root;
@property NSString *iin;
@property NSString *posDateTime;
@property NSString *pspClientSession;

-(void) setPspVersion:(NSString*)version;
-(void) setPspMerchantId:(NSString*)merchantId;

-(NSString*) getHeader;
-(NSString*) getFooter;
-(NSString*) getRootAsXml;
-(NSString*) getIINAsXml;
-(NSString*) getPosDateTimeAsXml;

-(GetIINDetailsResponse*) getResponseObject;

@end
