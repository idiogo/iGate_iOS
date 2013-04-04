//
//  ViewController.h
//  PortaoGaragem
//
//  Created by Diogo Carneiro on 29/01/13.
//  Copyright (c) 2013 Diogo Carneiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *botao;
@property (strong, nonatomic) IBOutlet UIButton *led;

- (IBAction)turnOn:(id)sender;
- (IBAction)turnOff:(id)sender;


@end
