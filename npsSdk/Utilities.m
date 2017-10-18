//
//  Utilities.m
//  ingeSDK
//
//  Created by Ingenico on 3/27/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//
#define kMagicSubtractionNumber 48

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
            /*
            conf.baseAction = @"http://psp.nps.com.ar/ws.php/";
            conf.host = @"www.psp.nps.com.ar";
            conf.url = @"https://psp.nps.com.ar/ws.php";
            */
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

+(Boolean) isValidLuhn:(NSString *)number{
    int Luhn = 0;
    for (int i=0;i<[number length];i++)
    {
        NSUInteger count = [number length]-1;
        int doubled = [[NSNumber numberWithUnsignedChar:[number characterAtIndex:count-i]] intValue] - kMagicSubtractionNumber;
        if (i % 2){
            doubled = doubled*2;
        }
        NSString *double_digit = [NSString stringWithFormat:@"%d",doubled];
        if ([[NSString stringWithFormat:@"%d",doubled] length] > 1)
        {
            Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:0]] intValue]-kMagicSubtractionNumber;
            Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:1]] intValue]-kMagicSubtractionNumber;}
        else{
            Luhn = Luhn + doubled;
        }
    }
    if (Luhn%10 == 0)
        return true;
    else
        return false;
}

+(NSString*) reverseString:(NSString*) texto{
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [texto length];
    while (charIndex > 0){
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[texto substringWithRange:subStrRange]];
    }
    
    return reversedString;
}


+(NSString*)getDate{
    NSDate *now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [outputFormatter stringFromDate:now];    return dateString;
}
@end
