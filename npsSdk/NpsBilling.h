//
//  Billing.h
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsXmlNode.h"
#import "NpsPerson.h"
#import "NpsAddress.h"

@interface NpsBilling : NpsXmlNode

@property NpsPerson *pspPerson;
@property NpsAddress *pspAddress;

-(NSString*) getPspPersonAsXml;

-(NSString*) getPspAddressAsXml;

@end
