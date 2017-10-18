//
//  CardInputDetails.h
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlNode.h"


@interface CardDetails : XmlNode

@property NSString *number;
@property NSString *expirationDate;
@property NSString *securityCode;
@property NSString *holderName;
@property NSString *expirationMonth;
@property NSString *expirationYear;
@property NSString *IIN;
@property NSString *last4;
@property NSString *maskedNumber;
@property NSString *maskedNumberAlternative;


-(NSString*) asXml;

-(NSString*) getNumberAsXml;
-(NSString*) getExpirationDateAsXml;
-(NSString*) getSecurityCodeAsXml;
-(NSString*) getHolderNameAsXml;

-(void) hidrateWithResponseDict:(NSDictionary*) dict;

@end
