//
//  ConfigViewController.m
//  PortaoGaragem
//
//  Created by Diogo Carneiro on 30/01/13.
//  Copyright (c) 2013 Diogo Carneiro. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	NSUserDefaults *db = [NSUserDefaults standardUserDefaults];
	[[self serverUrl] setText:[db objectForKey:@"serverUrl"]];
	[[self username] setText:[db objectForKey:@"username"]];
	[[self accessKey] setText:[db objectForKey:@"accessKey"]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([[segue identifier] isEqualToString:@"Salvar"]) {
		
		NSString *newServerUrl = [[self serverUrl] text];
		NSString *newUsername = [[self username] text];
		NSString *newAccessKey = [[self accessKey] text];
		
		NSUserDefaults *db = [NSUserDefaults standardUserDefaults];
		
		[db setObject:newServerUrl forKey:@"serverUrl"];
		[db setObject:newUsername forKey:@"username"];
		[db setObject:newAccessKey forKey:@"accessKey"];
		
		[db synchronize];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
