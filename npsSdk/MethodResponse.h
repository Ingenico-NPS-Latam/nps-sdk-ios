//
//  MethodResponse.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/23/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MethodResponse : NSObject

-(instancetype) initWithResponse:(NSDictionary*) dict;

@property NSError* responseError;
@property NSString* rawResponse;
@property NSDictionary* dictResponse;

-(void)setError:(NSError*)error;

-(NSString*)getResponseCode;

-(void) hidrate;

-(void) setResponse:(NSDictionary*) dict;
@end
