//
//  ViewController.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UITextField *cardNumberField;
    IBOutlet UITextField *expDateField;
    IBOutlet UITextField *cvcField;
    IBOutlet UITextField *installmentsField;
    IBOutlet UIButton *sendButton;
    IBOutlet UILabel *responseLabel;
}

-(IBAction)sendButton:(id)sender;

@end

