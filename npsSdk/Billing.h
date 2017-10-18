//
//  Billing.h
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "XmlNode.h"
#import "Person.h"
#import "Address.h"

@interface Billing : XmlNode

@property Person *pspPerson;
@property Address *pspAddress;

-(NSString*) getPspPersonAsXml;

-(NSString*) getPspAddressAsXml;

@end
