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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-center.png"]];

	[[self botao] setImage:[UIImage imageNamed:@"btn-novo.png"] forState:UIControlStateNormal];
    [[self botao] setImage:[UIImage imageNamed:@"btn-novo-pressing.png"] forState:UIControlStateHighlighted];
    [[self botao] setImage:[UIImage imageNamed:@"btn-novo-pressed.png"] forState:UIControlStateDisabled];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)turnOn:(id)sender{
	[self ligar];
}

- (IBAction)turnOff:(id)sender{
	[[self botao] setEnabled:NO];
	[self performSelector:@selector(desligar) withObject:nil afterDelay:1.0f];
	[self performSelector:@selector(habilitarBotao) withObject:nil afterDelay:2.0f];
}

- (void)ligar{
	NSLog(@"Arduino ligado");
	[self mudarPara:@"on"];
}

- (void)desligar{
	NSLog(@"Arduino desligado");
	[self mudarPara:@"off"];
}

- (void)habilitarBotao{
	[[self botao] setEnabled:YES];
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
