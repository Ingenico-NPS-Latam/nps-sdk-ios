//
//  GetInstallmentsOptionsResponse.h
//  npsSdk
//
//  Created by Ingenico on 6/7/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethodResponse.h"
#import "NpsUtilities.h"
#import "NpsInstallments.h"

@interface NpsGetInstallmentsOptionsResponse : NpsMethodResponse

@property NSString* _name;

@property NSString* merchantId;
@property NSString* product;
@property NSString* amount;
@property NSString* currency;
@property NSString* country;
@property NSString* numPayments;
@property NSMutableArray* installments;
@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* posDateTime;

-(void) setPspMerchantId:(NSString*)pspMerchantId;
-(NSMutableArray*)getInstallmentsFromResponse:(NSDictionary*)installments;

@end
