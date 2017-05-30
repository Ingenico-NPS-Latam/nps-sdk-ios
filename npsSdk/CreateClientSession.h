//
//  CreateClientSession.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Method.h"
#import "RootParameters.h"

@interface CreateClientSession : Method

@property RootParameters *root;
@property NSString *pspCustomerId;
@property NSString *pspPosDateTime;
@property NSString *pspSecureHash;

@end
