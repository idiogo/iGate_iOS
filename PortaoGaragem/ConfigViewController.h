//
//  ConfigViewController.h
//  PortaoGaragem
//
//  Created by Diogo Carneiro on 30/01/13.
//  Copyright (c) 2013 Diogo Carneiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *serverUrl;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *accessKey;


@end
