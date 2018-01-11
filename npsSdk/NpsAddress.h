//
//  Address.h
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsXmlNode.h"

@interface NpsAddress : NpsXmlNode

@property NSString *street;
@property NSString *houseNumber;
@property NSString *additionalInfo;
@property NSString *city;
@property NSString *stateProvince;
@property NSString *country;
@property NSString *zipCode;

-(NSString*) getStreetAsXml;
-(NSString*) getHouseNumberAsXml;
-(NSString*) getAdditionalInfoAsXml;
-(NSString*) getCityAsXml;
-(NSString*) getStateProvinceAsXml;
-(NSString*) getCountryAsXml;
-(NSString*) getZipCodeAsXml;

-(void) hidrateWithResponseDict:(NSDictionary*) dict;

@end
