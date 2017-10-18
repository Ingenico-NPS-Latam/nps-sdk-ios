//
//  MethodResponse.m
//  ingeSDK
//
//  Created by Ingenico on 3/23/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "MethodResponse.h"

@implementation MethodResponse

-(void)setError:(NSError *)error{
    self.responseError = error;
}

-(NSString*) getResponseCode{
    return @"";
}

-(void) setResponse:(NSDictionary *)dict{
    self.dictResponse = dict;
}

-(void) hidrate{};

@end
