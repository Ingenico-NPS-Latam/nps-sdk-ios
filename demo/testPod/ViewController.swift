//
//  ViewController.swift
//  testPod
//
//  Created by Gustavo Diaz on 5/18/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

import UIKit
import npsSdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //retrievePaymentMethodToken()
        //createPaymentMethodToken()
        //testiovation()
        //recachePaymentMethodToken()
        //getProductDetail()
        //Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testiovation() -> Void{
        print (Nps.getDeviceFingerPrint())
    }
    
    func retrievePaymentMethodToken() -> Void {
        let nps = Nps(environment: SANDBOX)!
        nps.merchantId = "psp_test"
        nps.clientSession = "your_session"
        
        nps.retrievePaymentMethodToken("your_token",
                                        methodResponse: {( methodResponse: RetrievePaymentMethodTokenResponse?, error: Error?) -> Void in
            if error == nil{
                print("\(methodResponse?.responseExtended)")
                print(methodResponse?.dictResponse! as Any)
            }
        })
    }
    
    func recachePaymentMethodToken() -> Void {
        let nps = Nps(environment: SANDBOX)!
        nps.merchantId = "psp_test"
        nps.clientSession = "your_session"
        
        let billing = Billing()
        billing.pspPerson.firstName = "JOHN DOE"
        
        
        nps.recachePaymentMethodToken("your_pmid", cardSecurityCode: "123", billingDetails: billing,
                                      methodResponse: {( methodResponse: RecachePaymentMethodTokenResponse?, error: Error?) -> Void in
                if error == nil{
                    print(methodResponse?.responseCod as Any)
                }
        })
    }
    
    func getProductDetail() -> Void{
        let nps = Nps(environment: SANDBOX)!
        nps.merchantId = "psp_test"
        nps.clientSession = "fuck_session"
        
        nps.getProduct("424242",
                       methodResponse:{( methodResponse: GetIINDetailsResponse?, error: Error?) -> Void in
            if error == nil{
                print(methodResponse?.responseCod as Any)
            }
        })
        
    }
    
    func createPaymentMethodToken() -> Void {
        let nps = Nps(environment: SANDBOX)!
        nps.merchantId = "psp_test"
        nps.clientSession = "your_session"
        
        let card = CardDetails()
        
        card.number = "4507990000000010";
        card.holderName = "JOHN DOE";
        card.securityCode = "123";
        card.expirationDate = "1909";
        
        
        let billing = Billing()
        
        billing.pspPerson.firstName = "JOHN";
        billing.pspPerson.lastName = "Smith";
        billing.pspPerson.dateOfBirth = "1987-01-01";
        billing.pspPerson.gender = "M";
        billing.pspPerson.nationality = "ARG";
        billing.pspPerson.idType = "200";
        billing.pspPerson.idNumber = "95665091";
        billing.pspPerson.phoneNumber1 = "4123-1234";
        billing.pspPerson.phoneNumber2 = "4123-5678";
        
        billing.pspAddress.additionalInfo = "JOHN";
        billing.pspAddress.city = "Buenos Aires";
        billing.pspAddress.stateProvince = "CABA";
        billing.pspAddress.country = "ARG";
        billing.pspAddress.zipCode = "1425";
        billing.pspAddress.street = "suipacha";
        billing.pspAddress.houseNumber = "32123123";
        
        nps.createPaymentMethodToken(card, billingDetails: billing, methodResponse: {( methodResponse: CreatePaymentMethodTokenResponse?, error: Error?) -> Void in
            if error == nil{
                print(methodResponse?.responseExtended as Any)
            }
        })

        
    }
}

