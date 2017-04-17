//
//  ViewController.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "ViewController.h"

#import "RootParameters.h"
#import "Methods/CreatePaymentMethodToken.h"
#import "Methods/RetrievePaymentMethodToken.h"
#import "Nps.h"
#import "Nodes/CardDetails.h"
#import "Nodes/Billing.h"
#import "MethodResponses/CreatePaymentMethodTokenResponse.h"
#import "Utils/Environments.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)retrievePMT:(id)sender{
    retrieveLabel.text = @"Requesting...";
    
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    nps.merchantId = @"psp_test";
    nps.pspVersion = @"2.2";
    nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";
    
    
    [nps retrievePaymentMethodToken:@"2gOwo2esUsfZwFRy2QxqppRN0H0tHZ9v"
                      methodResponse:^(RetrievePaymentMethodTokenResponse* methodResponse, NSError *error) {
                          NSLog(@"%@", [methodResponse responseCod]);
                          retrieveLabel.text = [methodResponse responseMsg];
                      }];
    
}

-(IBAction)recachePMT:(id)sender{
    recacheLabel.text = @"Requesting...";
    
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    nps.merchantId = @"psp_test";
    nps.pspVersion = @"2.2";
    nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";
    
    
    Billing *billingDetailss = [[Billing alloc]init];
    
    billingDetailss.pspPerson.firstName = @"JOHN DOE";
    
    [nps recachePaymentMethodToken:@"kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg"
                   cardSecurityCode:@"123"
                     billingDetails:billingDetailss
                     methodResponse:^(RecachePaymentMethodTokenResponse *methodResponse, NSError *error) {
                         NSLog(@"%@", [methodResponse responseCod]);
                         recacheLabel.text = [methodResponse responseMsg];
                     }];
    
}

-(IBAction)getProduct:(id)sender{
    getProductLabel.text = @"Requesting ...";
    
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    nps.merchantId = @"psp_test";
    nps.pspVersion = @"2.2";
    nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";
    
    
    [nps getProduct:@"424242"
        postDateTime:@"2016-12-01 12:00:00"
      methodResponse:^(GetIINDetailsResponse *methodResponse, NSError *error) {
          NSLog(@"%@", [methodResponse responseCod]);
          getProductLabel.text = [methodResponse responseMsg];
      }];
}

-(IBAction)sendButton:(id)sender{
    responseLabel.text = @"Requesting...";
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    nps.merchantId = @"psp_test";
    nps.pspVersion = @"2.2";
    nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";
    
    CardDetails *card = [[CardDetails alloc]init];
    
    card.number = @"4507990000000010";
    card.holderName = @"JOHN DOE";
    card.securityCode = @"123";
    card.expirationDate = @"1909";
    
    Billing *billingDetails = [[Billing alloc]init];
    
    billingDetails.pspPerson.firstName = @"JOHN DOE";
    
    [nps createPaymentMethodToken:card
                   billingDetails:billingDetails
                   methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse, NSError *error) {
                       if(!error){
                           NSLog(@"%@", [methodResponse responseCod]);
                           responseLabel.text = [methodResponse responseMsg];
                       }
                   }];
 		
}


- (void)viewDidLoad {
    [super viewDidLoad];
    cardNumberField.text = @"4850110000000000";
    expDateField.text = @"1909";
    cvcField.text = @"123";    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

