//
//  ViewController.m
//  PortaoGaragem
//
//  Created by Diogo Carneiro on 29/01/13.
//  Copyright (c) 2013 Diogo Carneiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize botao,led;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[[self botao] setImage:[UIImage imageNamed:@"unpressed.png"] forState:UIControlStateNormal];
	[[self botao] setImage:[UIImage imageNamed:@"pressed.png"] forState:UIControlStateHighlighted];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)turnOn:(id)sender{
	[self ligarLed];
	[self ligar];
}

- (IBAction)turnOff:(id)sender{
	[self performSelector:@selector(ledDesligando) withObject:nil afterDelay:1];
	[self performSelector:@selector(desligarComDelay) withObject:nil afterDelay:2.0f];
}

- (void)desligarComDelay{
	[self desligarLed];
	[self desligar];
}

- (void)ligar{
	[self mudarPara:@"on"];
}

- (void)desligar{
	[self mudarPara:@"off"];
}

- (void)desligarLed{
	[[self led] setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
}

- (void)ligarLed{
	[[self led] setTitleColor:[UIColor greenColor] forState:UIControlStateDisabled];
}

- (void)ledDesligando{
	[[self led] setTitleColor:[UIColor yellowColor] forState:UIControlStateDisabled];
}

- (void)mudarPara:(NSString *)status{
	
	NSUserDefaults *db = [NSUserDefaults standardUserDefaults];
	NSString *serverUrl = [db objectForKey:@"serverUrl"];
	NSString *username = [db objectForKey:@"username"];
	NSString *accessKey = [db objectForKey:@"accessKey"];
	
	///arduino.php?usuario=USUARIO&chave=CHAVE&acao=off
	NSString *urlString = [NSString stringWithFormat:@"%@/arduino.php?usuario=%@&chave=%@&acao=%@", serverUrl, username, accessKey, status];
	NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:nil];
}

@end
