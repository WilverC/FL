//
//  ViewController.m
//  FL
//
//  Created by Alberto Garcia on 24/01/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "ViewControllerInicio.h"
#import "ViewControllerRegistro.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hello world");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Probando{
    NSLog(@"Hola");
}

-(IBAction)btnSoyEmpresa:(UIButton *)sender{
    ViewController *vcr = [[ViewController alloc]	initWithNibName:@"ViewControllerRegistro" bundle:Nil];
       // [self presentedViewController = ];
}

@end
