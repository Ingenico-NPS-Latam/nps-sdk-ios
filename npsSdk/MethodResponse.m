//
//  MethodResponse.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/23/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
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
