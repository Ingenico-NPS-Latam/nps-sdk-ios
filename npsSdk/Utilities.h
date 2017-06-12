//
//  Utilities.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/27/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlNode.h"
#import "Environments.h"
#import "Configuration.h"

@interface Utilities : NSObject

+(NSString*) buildXml:(NSString*)label
                value:(NSString*)value
                 type:(NSString*)type;

+(NSString*) buildNodeHeaderAsXml:(NSString*) label
                        nodoAsXml:(NSString*) nodo;


+(Boolean) isLessEqualThan:(NSString*) value
                comparizon:(int) size;

+(Boolean) isMoreEqualThan:(NSString*) value
                comparizon:(int) size;


+(Boolean) hazCorrectSize:(NSString*) value
                      max:(int) maxSize
                  minimum:(int)minSize;

+(Configuration*) getEnvironmentConfiguration:(int) environ;

+(NSString*) getValueFromResponseDictionary:(NSDictionary*) dict
                                        key:(NSString*) key;

+(NSDictionary*) removeTrashFromResponse:(NSDictionary*) response
                             responseKey:(NSString*) responseKey;

+(NSString*) getDate;

+(Boolean) isValidLuhn:(NSString*) number;

+(NSString*) reverseString:(NSString*) texto;

@end
