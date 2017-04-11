//
//  NpsSoapClient.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 4/3/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STHTTPRequest.h"
#import "XMLReader.h"
#import "MethodResponse.h"
#import "Method.h"
#import "Configuration.h"

@interface NpsSoapClient : NSObject

-(instancetype) initWithConfiguration:(Configuration*) conf;

@property Configuration *conf;

-(void)send:(Method*)method
methodResponse:(void(^)(MethodResponse *methodResponse))response;


@end
