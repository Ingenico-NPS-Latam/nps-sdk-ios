//
//  MethodResponse.h
//  ingeSDK
//
//  Created by Ingenico on 3/23/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MethodResponse : NSObject

@property NSError* responseError;
@property NSString* rawResponse;
@property NSDictionary* dictResponse;

-(void)setError:(NSError*)error;

-(NSString*)getResponseCode;

-(void) hidrate;

-(void) setResponse:(NSDictionary*) dict;
@end
