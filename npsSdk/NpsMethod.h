//
//  Method.h
//  ingeSDK
//
//  Created by Ingenico on 3/21/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NpsXmlNode.h"
#import "NpsMethodResponse.h"

@interface NpsMethod : NpsXmlNode

@property NSString *superHeader;
@property NSString *superFooter;
@property NSString *name;

@property NpsMethodResponse *methodResponse;

-(NpsMethodResponse*) getResponseObject;

@end
