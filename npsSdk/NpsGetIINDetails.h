//
//  GetIINDetails.h
//  ingeSDK
//
//  Created by Ingenico on 3/30/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethod.h"
#import "NpsRootParameters.h"
#import "NpsGetIINDetailsResponse.h"

@interface NpsGetIINDetails : NpsMethod

@property NpsRootParameters *root;
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

-(NpsGetIINDetailsResponse*) getResponseObject;

@end
