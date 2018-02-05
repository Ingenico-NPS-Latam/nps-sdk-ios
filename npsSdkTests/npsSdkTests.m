//
//  npsSdkTests.m
//  npsSdkTests
//
//  Created by Ingenico on 5/16/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Nps.h"
#import "NpsUtilities.h"


@interface npsSdkTests : XCTestCase

@end

@implementation npsSdkTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testDate{
    [NpsUtilities getDate];
}

-(void)testGetIINDetails{
    
    XCTestExpectation * expectation = [self expectationWithDescription:@"no workeo"];
    
    
    Nps *nps = [[Nps alloc]initWithEnvironment:NPSSANDBOX];
    nps.merchantId = @"psp_test";
    nps.clientSession = @"7csdPFVDLqH3jL2I6nsniJZdtOdwZDteIFeIxBWOcUY9uXpwG5i1LmQPeBIbd6ka";
    
    [nps getIINDetails:@"424242"
        methodResponse:^(NpsGetIINDetailsResponse *methodResponse, NSError *error) {
            if (!error){
                NSLog(@"%@", [methodResponse responseCod]);
                [expectation fulfill];
                NSLog(@"%@", [methodResponse merchantId]);
                
            }
        }];
    
    [self waitForExpectationsWithTimeout:30.0 handler:^(NSError *error){
        if (error){
            NSLog(@"%@", error);
        }
    }
     ];
    
}

-(void)testGetPPT{
    XCTestExpectation * expectation = [self expectationWithDescription:@"no workeo"];
    
    Nps *nps = [[Nps alloc]initWithEnvironment:NPSSANDBOX];
    nps.merchantId = @"psp_test";
    nps.clientSession = @"USBmdYFceReXIM1a1B9OY8uGklCEecyqhuzina04LewNzFaNlOt1Ldi4kWu8lxkI"; //STAGING
    
    //nps.clientSession = @"ZNbM6ilYCqvJVJLlOZezXioSSKDEnLERJnKfUsPv3JNEz9DFbPK8sZdHjbqA9DpR"; //SANDBOX
    
    NpsCardDetails *card = [[NpsCardDetails alloc]init];
    
    card.number = @"4507990000000010";
    card.holderName = @"JOHN DOE";
    card.securityCode = @"123";
    card.expirationDate = @"1909";
    
    [nps createPaymentMethodToken:card
                   billingDetails:nil
                   methodResponse:^(NpsCreatePaymentMethodTokenResponse* methodResponse, NSError *error) {
                       if(!error){
                           NSLog(@"%@", [methodResponse responseCod]);
                           [expectation fulfill];
                           NSLog(@"%@", [methodResponse product]);
                           NSLog(@"%@", [methodResponse responseExtended]);
                           NSLog(@"%@", [methodResponse paymentMethodToken]);
                       }
                   }];
    
    
    [self waitForExpectationsWithTimeout:50.0 handler:^(NSError *error){
        if (error){
            NSLog(@"%@", error);
        }
    }
     ];}

-(void)testGetProduct{
    XCTestExpectation * expectation = [self expectationWithDescription:@"no workeo"];
    
    
    Nps *nps = [[Nps alloc]initWithEnvironment:NPSSANDBOX];
    nps.merchantId = @"psp_test";
    nps.clientSession = @"7csdPFVDLqH3jL2I6nsniJZdtOdwZDteIFeIxBWOcUY9uXpwG5i1LmQPeBIbd6ka";
    
    [nps getProduct:@"424242"
        methodResponse:^(NpsGetProductResponse *methodResponse, NSError *error) {
            if (!error){
                NSLog(@"%@", [methodResponse responseCod]);
                [expectation fulfill];
                NSLog(@"%@", [methodResponse product]);
                NSLog(@"%@", [methodResponse responseExtended]);
            }
        }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error){
            if (error){
                NSLog(@"%@", error);
            }
        }
     ];
    
}

-(void)testValidateNumber{
    Nps *nps = [[Nps alloc]initWithEnvironment:NPSSANDBOX];
    nps.merchantId = @"psp_test";
    nps.clientSession = @"x";
    NSLog(@"%hhu", [nps validateCardNumber:@"4517660119344587"]);
    
}


-(void)testinstallments{
    //XCTestExpectation * expectation = [self expectationWithDescription:@"no workeo"];
    
    Nps *nps = [[Nps alloc]initWithEnvironment:NPSSANDBOX];
    nps.merchantId = @"psp_test";
    nps.clientSession = @"7csdPFVDLqH3jL2I6nsniJZdtOdwZDteIFeIxBWOcUY9uXpwG5i1LmQPeBIbd6ka";
    NSLog(@"%@", @"empezando");
    [nps getInstallmentsOptions:@"100"
                        product:@"14"
                       currency:@"152"
                        country:@"CHL"
                    numPayments:@"2"
             paymentMethodToken:@"kkvKuOfD2bNKXCBYDkunIRqImvNFNxB3"
                 methodResponse:^(NpsGetInstallmentsOptionsResponse *methodResponse, NSError *error) {
                     if (!error){
                         NSLog(@"%@", [methodResponse responseCod]);
                         for (NpsInstallments *inst in [methodResponse installments]){
                             NSLog(@"%@", [inst installmentAmount]);
                             NSLog(@"%@", [inst interestRate]);
                             NSLog(@"%@", [inst numPayments]);
                         }
                         
                         //[expectation fulfill];
                         NSLog(@"%@", @"termiando bien");
                         NSLog(@"%@", [methodResponse responseExtended]);
                     }
                     NSLog(@"%@", @"termiando con error");
                     NSLog(@"%@", error);
                 }];
    NSLog(@"%@", @"termiando");
    /*[self waitForExpectationsWithTimeout:70.0 handler:^(NSError *error){
        if (error){
            NSLog(@"%@ FUCK", error);
        }
    }*/
     //];
    
}

-(void)testIovation{
    NSLog(@"%@", [Nps getDeviceFingerPrint]);
}

-(void)testReverseString{
    NSLog(@"%@", [NpsUtilities reverseString:@"4111000000000010"]);
}


@end	
