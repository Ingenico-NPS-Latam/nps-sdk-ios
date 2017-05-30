//
//  Billing.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/29/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
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
