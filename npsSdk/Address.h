//
//  Address.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/29/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "XmlNode.h"

@interface Address : XmlNode

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
