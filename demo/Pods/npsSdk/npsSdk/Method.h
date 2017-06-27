//
//  Method.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/21/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlNode.h"
#import "MethodResponse.h"

@interface Method : XmlNode

@property NSString *superHeader;
@property NSString *superFooter;
@property NSString *name;

@property MethodResponse *methodResponse;

-(MethodResponse*) getResponseObject;

@end
