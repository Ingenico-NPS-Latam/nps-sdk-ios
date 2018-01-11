//
//  NpsSoapClient.h
//  ingeSDK
//
//  Created by Ingenico on 4/3/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STHTTPRequest.h"
#import "XMLReader.h"
#import "NpsMethodResponse.h"
#import "NpsMethod.h"
#import "NpsConfiguration.h"

@interface NpsSoapClient : NSObject

-(instancetype) initWithConfiguration:(NpsConfiguration*) conf;

@property NpsConfiguration *conf;

-(void)send:(NpsMethod*)method
methodResponse:(void (^)(NpsMethodResponse *methodResponse, NSError *error))response;


@end
