//
//  Utilities.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/27/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "Utilities.h"
#import "Environments.h"


@implementation Utilities

+(NSString*)buildXml:(NSString *)label
               value:(NSString *)value
                type:(NSString *)type{
    
    NSString* returnValue = @"";
    if ((value != nil) && (![value  isEqualToString: @""])){
        returnValue = [NSString stringWithFormat:@"<%1$@ xsi:type=\"ns%3$@:string\">%2$@</%1$@>", label, value, type];
    }
    return returnValue;
}

+(NSString*)buildNodeHeaderAsXml:(NSString *)label nodoAsXml:(NSString *)nodo{
    NSString* returnValue = @"";
    if ((nodo != nil) && (![nodo isEqualToString: @""])){
        returnValue = [NSString stringWithFormat:@"<%1$@>%2$@</%1$@>", label, nodo];
    }
    return returnValue;
}


+(Boolean) isLessEqualThan:(NSString*) value
                comparizon:(int)size{
    return ([value length] <= size);
}

+(Boolean) isMoreEqualThan:(NSString*) value
                comparizon:(int)size{
    return ([value length] >= size);
}

+(Boolean) hazCorrectSize:(NSString*) value
                      max:(int)maxSize
                  minimum:(int)minSize{
    return ([self isLessEqualThan:value comparizon:maxSize] && ([self isMoreEqualThan:value comparizon:minSize]));
}

+(NSString*) getValueFromResponseDictionary:(NSDictionary *)dict
                                        key:(NSString *)key{
    NSString *resp = nil;
    if ([dict objectForKey:key]){
        resp = dict[key][@"text"];
    }
    return resp;
}

+(NSDictionary*) removeTrashFromResponse:(NSDictionary*) response
                             responseKey:(NSString*) responseKey{
    
    return response[@"SOAP-ENV:Envelope"][@"SOAP-ENV:Body"][responseKey][@"Respuesta"];
}

+(Configuration*) getEnvironmentConfiguration:(int) environ{
    Configuration *conf = [[Configuration alloc]init];
    switch (environ) {
        case 0:
            conf.baseAction = @"http://sandbox.com.ar/ws.php/";
            conf.host = @"www.sandbox.nps.com.ar";
            conf.url = @"https://sandbox.nps.com.ar";
            break;
        case 1:
            conf.baseAction = @"http://implementacion.com.ar/ws.php/";
            conf.host = @"www.implementacion.nps.com.ar";
            conf.url = @"https://implementacion.nps.com.ar";
            break;
        case 2:
            conf.baseAction = @"http://service2.com.ar/ws.php/";
            conf.host = @"www.service2.nps.com.ar";
            conf.url = @"https://service2.nps.com.ar";
            break;        
    }
    
    return conf;
}
@end
